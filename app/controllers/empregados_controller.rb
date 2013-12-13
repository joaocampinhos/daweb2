class EmpregadosController < ApplicationController
  before_filter :authenticate_empregado!
  before_action :set_empregado, only: [:show, :edit, :update, :destroy]

  # GET /empregados
  # GET /empregados.json
  def index
    @empregados = Empregado.all
  end

  # GET /empregados/1
  # GET /empregados/1.json
  def show
    #Passar um booleano a ver se é amigo ou não
    @amigo = false
    @pendente = false
    current_empregado.contactos.each do |a|
      if a.amigo_id == @empregado.id
        @amigo = true
        if a.pendente
          @pendente = true
        end
      end
    end
    @namigos =@empregado.contactos.where(:pendente => false).count
  end

  # GET /empregados/new
  def new
    @empregado = Empregado.find(current_empregado.id)
    render :layout => false
  end

  # GET /empregados/1/edit
  def edit
    cv = Cv.find_or_initialize_by(empregado_id: current_empregado.id)
    cv.save
    if @empregado.id != current_empregado.id
      redirect_to root_path
    end
  end

  # POST /empregados
  # POST /empregados.json
  def create
    @empregado = Empregado.new(empregado_params)

    respond_to do |format|
      if @empregado.save
        format.html { redirect_to @empregado, notice: 'Empregado was successfully created.' }
        format.json { render action: 'show', status: :created, location: @empregado }
      else
        format.html { render action: 'new' }
        format.json { render json: @empregado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empregados/1
  # PATCH/PUT /empregados/1.json
  def update
    cv = Cv.find_or_initialize_by(empregado_id: current_empregado.id)
    if params[:empregado][:cv_attributes]
      academic = params[:empregado][:cv_attributes][:academic].split(/\n/)
      exp = params[:empregado][:cv_attributes][:exp].split(/\n/)
      skills = params[:empregado][:cv_attributes][:skills].split(/\n/)
      cv.update(:academic => academic, :exp => exp, :skills => skills)
    end
    respond_to do |format|
      if @empregado.update(empregado_params)
        format.html { redirect_to @empregado, notice: 'Empregado was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @empregado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empregados/1
  # DELETE /empregados/1.json
  def destroy
    @empregado.destroy
    respond_to do |format|
      format.html { redirect_to empregados_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empregado
      @empregado = Empregado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def empregado_params
      params.require(:empregado).permit(:name, :departamento_id, :image, :job, :location, :about)
    end
end
