class BarriosController < ApplicationController
  load_and_authorize_resource :only => [:new, :edit, :destroy] #codigo de permiso de usuario adm
   
   before_filter :find_municipio_and_barrio

 def index#codigo de buscador
    @nrp = (params[:registro] != nil)? params[:registro].to_i : 2 # seleccionar el numero de registros

    if ((@nrp) <= 0)
       @nrp = 3
    end

    @barrios = @municipio.barrios.search(params[:search]).paginate(:per_page=>(@nrp), :page=>params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @barrios }
    end
  end

  def show
      @barrio = Barrio.find(params[:id])
  end

  def new
      @barrio= Barrio.new
  end

  def edit
      @barrio = Barrio.find(params[:id])
  end

  def create
      @barrio = Barrio.new(params[:barrio])
      @barrio.municipio_id = @municipio.id
      render :action => :new unless @barrio.save
      @barrios = Barrio.all
  end

  def update
      @barrio = Barrio.find(params[:id])
     
      render :action => :edit unless @barrio.update_attributes(params[:barrio])
  end
  def destroy
      @barrio = Barrio.find(params[:id])
      @barrio.destroy
  end
  
  def find_municipio_and_barrio  # detalle amestro
      @municipio = Municipio.find(params[:municipio_id])
      @barrio = Barrio.find(params[:id]) if params[:id]
      @barrios = Barrio.all
  end
  
end
