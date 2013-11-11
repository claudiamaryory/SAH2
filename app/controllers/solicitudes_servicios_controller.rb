class SolicitudesServiciosController < ApplicationController
load_and_authorize_resource :only => [:new, :edit, :destroy] #codigo de permiso de usuario adm
  before_filter :find_cliente_and_solicitud_servicio # filtro para detalle amestro
  
  def index
    #@solicitudes_servicios = SolicitudServicio.all
    @solicitudes_servicios = @cliente.solicitudes_servicios.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @solicitudes_servicios }
      format.js
    end
  end


  def show
    @solicitud_servicio = SolicitudServicio.find(params[:id])
    
  end


  def new
    @solicitud_servicio = SolicitudServicio.new

  end

  
  def edit
    @solicitud_servicio = SolicitudServicio.find(params[:id])
  end

 
  def create
    @solicitud_servicio = SolicitudServicio.new(params[:solicitud_servicio])
    @solicitud_servicio.cliente_id = @cliente.id
    render :action => :new unless @solicitud_servicio.save
    
  end

   def update
    @solicitud_servicio = SolicitudServicio.find(params[:id])
    render :action => :edit unless @solicitud_servicio.update_attributes(params[:solicitud_servicio])
     
  end


  def destroy
    @solicitud_servicio = SolicitudServicio.find(params[:id])
    @solicitud_servicio.destroy

  end
  
  def find_cliente_and_solicitud_servicio # filtro de detalle maestro
    @cliente = Cliente.find(params[:cliente_id])
    @solicitud_servicio = SolicitudServicio.find(params[:id]) if params[:id]
  
  end
  
end
