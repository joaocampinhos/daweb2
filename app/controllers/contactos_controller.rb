class ContactosController < ApplicationController
  before_action :set_contacto, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_empregado!

  # GET /contactos
  # GET /contactos.json
  def index
    # Ir buscar todas as amizes que o current user tem com os outros utilizadores
    #
    # Se foi o user que pediu amizade e está pendente, então mete no vector das pendentes (pode apagar o pedido)
    # Se pediram o user em amizade e está pendente, então mete no vector dos por aceitar (pode aceitar ou recusar a amizade)
    # Tudo o resto vai para o vector dos contactos já existentes
    @amigos = []
    @pendentes = []
    @porac = []
    Contacto.where(empregado_id: current_empregado.id).each do |c|
      contacto = Empregado.find(c.amigo_id)
      if c.pendente
        @pendentes.push(contacto)
        logger.debug "Pedi amizade e não aceitaram"
      else
        @amigos.push(contacto)
        logger.debug "Pedi amizade e já aceitaram"
      end
    end
    Contacto.where(amigo_id: current_empregado.id).each do |c|
      contacto = Empregado.find(c.empregado_id)
      if c.pendente
        @porac.push(contacto)
        logger.debug "Pediram-me amizade e não aceitei"
      end
    end
  end

  def aceitar
    @contacto = Contacto.new({:empregado_id => current_empregado.id, :amigo_id => params[:amigoid], :pendente => false})
    @up = Contacto.find_by({:empregado_id => params[:amigoid], :amigo_id => current_empregado.id})
    @up.pendente = false
    #Ver se isto dá erro
    @up.save
    @contacto.save
    redirect_to contactos_url
  end

  def recusar
    @contacto = Contacto.find_by({:empregado_id => params[:amigoid], :amigo_id => current_empregado.id})
    @contacto.destroy
    redirect_to contactos_url
  end

  # GET /contactos/1
  # GET /contactos/1.json
  def show
  end

  # GET /contactos/new
  def new
    @contacto = Contacto.new
  end

  # GET /contactos/1/edit
  def edit
  end

  # POST /contactos
  # POST /contactos.json
  def create
    @contacto = Contacto.new(contacto_params)

    respond_to do |format|
      if @contacto.save
        format.html { redirect_to @contacto, notice: 'Contacto was successfully created.' }
        format.json { render action: 'show', status: :created, location: @contacto }
      else
        format.html { render action: 'new' }
        format.json { render json: @contacto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contactos/1
  # PATCH/PUT /contactos/1.json
  def update
    respond_to do |format|
      if @contacto.update(contacto_params)
        format.html { redirect_to @contacto, notice: 'Contacto was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @contacto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contactos/1
  # DELETE /contactos/1.json
  def destroy
    @contacto.destroy
    respond_to do |format|
      format.html { redirect_to contactos_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_contacto
    @contacto = Contacto.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def contacto_params
    params[:contacto]
  end
end
