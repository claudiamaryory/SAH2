class CalificacionesServiciosController < ApplicationController
 load_and_authorize_resource :only => [:new, :edit, :destroy] #codigo de permiso de usuario adm
  def index
    @nrp = (params[:registro] != nil)? params[:registro].to_i : 3 # seleccionar el numero de registros

    if ((@nrp) <= 0)
       @nrp = 3
    end


    @calificaciones_servicios = CalificacionServicio.search(params[:search]).paginate(:per_page=>(@nrp), :page=>params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @calificaciones_servicios }
    end
  end


  def show
    @calificacion_servicio = CalificacionServicio.find(params[:id])
  end

  def new
    @calificacion_servicio = CalificacionServicio.new
  end


  def edit
    @calificacion_servicio = CalificacionServicio.find(params[:id])
  end

  def create
    @calificacion_servicio = CalificacionServicio.new(params[:calificacion_servicio])
    render :action => :new unless @calificacion_servicio.save
    @calificaciones_servicios = CalificacionServicio.all
      
  end

  
  def update
    @calificacion_servicio = CalificacionServicio.find(params[:id])
     render :action => :edit unless @calificacion_servicio.update_attributes(params[:calificacion_servicio])
  end

 
  def destroy
    @calificacion_servicio = CalificacionServicio.find(params[:id])
    @calificacion_servicio.destroy
    @calificaciones_servicios = CalificacionServicio.all
  end
end
