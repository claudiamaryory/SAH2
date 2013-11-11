class EstadosController < ApplicationController
 load_and_authorize_resource :only => [:new, :edit, :destroy] #codigo de permiso de usuario adm
  def index
    @estados = Estado.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @estados }
    end
  end

 
  def show
    @estado = Estado.find(params[:id])
  
  end

 
  def new
    @estado = Estado.new
    
  end

  def edit
    @estado = Estado.find(params[:id])
  end


  def create
    @estado = Estado.new(params[:estado])
    render :action => :new unless @estado.save
        
  end

  
  def update
    @estado = Estado.find(params[:id])
    render :action => :edit unless @estado.update_attributes(params[:estado])
      
  end

  def destroy
    @estado = Estado.find(params[:id])
    @estado.destroy

  end
end
