class EmpresasController < ApplicationController
  before_filter :authenticate_empregado!
  before_action :set_empresa, only: [:show, :edit, :update, :destroy]

  # GET /empresas
  # GET /empresas.json
  def index
    @empresas = Empresa.all
  end

  # GET /empresas/1
  # GET /empresas/1.json
  def show
    @owner = false
    if  @empresa.owner_id == current_empregado.id
      @owner = true
    end
  end

  # GET /empresas/new
  def new
    comp = Empresa.find_by(:owner_id => current_empregado.id)
    if comp
      redirect_to comp
    else
      @empresa = Empresa.new(:owner_id => current_empregado.id)
    end
  end

  # GET /empresas/1/edit
  def edit
  end

  def recrutar
    eid = Empresa.find_by(:owner_id => current_empregado.id).id
    did = Departamento.find_by(:empresa_id => eid, :name => "Novos Funcionários")
    if !did
      did = Departamento.create(:empresa_id => eid, :name => "Novos Funcionários").id
    else
      did = did.id
    end
    user = Empregado.find(params[:emp_id])
    user.departamento_id = did
    user.save
    redirect_to contactos_path
  end

  def despedir
    user = Empregado.find(params[:emp_id])
    user.departamento_id = nil
    user.save
    emp = Empresa.find_by(:owner_id => current_empregado.id)
    logger.debug emp
    redirect_to empresa_path Empresa.find_by(:owner_id => current_empregado.id)
  end

  # POST /empresas
  # POST /empresas.json
  def create
    @empresa = Empresa.new(empresa_params)

    respond_to do |format|
      if @empresa.save
        format.html { redirect_to @empresa, notice: 'Empresa was successfully created.' }
        format.json { render action: 'show', status: :created, location: @empresa }
      else
        format.html { render action: 'new' }
        format.json { render json: @empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empresas/1
  # PATCH/PUT /empresas/1.json
  def update
    respond_to do |format|
      if @empresa.update(empresa_params)
        format.html { redirect_to @empresa, notice: 'Empresa was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empresas/1
  # DELETE /empresas/1.json
  def destroy
    @empresa.destroy
    respond_to do |format|
      format.html { redirect_to empresas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empresa
      @empresa = Empresa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def empresa_params
      params.require(:empresa).permit(:name, :owner_id, :logo, :description)
    end
end
