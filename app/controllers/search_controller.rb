class SearchController < ApplicationController
  def index
    #Pesquisa
    #Retirar argumentos do URL, pesquisar e "mandar" para a view
    #find(:all, :conditions => ['name LIKE ?', "%#{search}%"]
    @empresas = []
    @empregados = []
    logger.debug params
    if params[:q]
      search = params[:q].downcase
      @empresas = Empresa.find(:all, :conditions => ['LOWER(name) LIKE ?', "%#{search}%"])
      @empregados= Empregado.find(:all, :conditions => ['LOWER(name) LIKE ?', "%#{search}%"])
    elsif params[:contact]
      search = params[:contact].downcase
      @empregados= Empregado.find(:all, :conditions => ['LOWER(name) LIKE ?', "%#{search}%"])
    elsif params[:company]
      search = params[:company].downcase
      @empresas = Empresa.find(:all, :conditions => ['LOWER(name) LIKE ?', "%#{search}%"])
    end
  end
end
