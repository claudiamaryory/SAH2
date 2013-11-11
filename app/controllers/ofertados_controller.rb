class OfertadosController < ApplicationController
  load_and_authorize_resource :only => [:new, :edit, :destroy] #codigo de permiso de usuario adm
  def index#codigo de buscador
    @nrp = (params[:registro] != nil)? params[:registro].to_i : 2 # seleccionar el numero de registros

    if ((@nrp) <= 0)
       @nrp = 3
    end

    @ofertados = Ofertado.search(params[:search]).paginate(:per_page=>(@nrp), :page=>params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @ofertados }
    end
  end

  
  def show
    @ofertado = Ofertado.find(params[:id]) 
  end

  
  def new
    @ofertado = Ofertado.new
  end

  def edit
    @ofertado = Ofertado.find(params[:id])
  end

  
  def create
    @ofertado = Ofertado.new(params[:ofertado])
   render :action => :new unless @ofertado.save
     @ofertados = Ofertado.all
  end

  
  def update
    @ofertado = Ofertado.find(params[:id])
   render :action => :edit unless @ofertado.update_attributes(params[:ofertado])
   
  end

 
  def destroy
    @ofertado = Ofertado.find(params[:id])
    @ofertado.destroy
     @ofertados = Ofertado.all
  end
end
