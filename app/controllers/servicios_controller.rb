class ServiciosController < ApplicationController
load_and_authorize_resource :only => [:new, :edit, :destroy] #codigo de permiso de usuario adm
  #require 'servicio_list.rb'
 # ServicioMailer.registration_contacto(@servicio).deliver 

  before_filter :find_solicitudservicio_and_servicio, :except => :ordenserv # filtro para detalle amestro
  

  def index
    @servicios = @solicitud_servicio.servicios.all 
    #@servicios = Servicio.all 
    output = ServicioList.new(Servicio.all, view_context) # Aquí instancio el documento pdf
    respond_to do |format|
      format.pdf{
        send_data output.render, :filename => "serviciosList.pdf", :type => "application/pdf", 
      :disposition => "inline" # este parámetro permite ver el documento pdf en linea.
      }
      format.html #{ render :text => "<h1>Use .pdf</h1>".html_safe }
      format.json { render json: @servicios  }
    end
  end

  def ordenserv

     @servicios = Servicio.order(:fecha)

     @servicios = Servicio.order(:empleado_id, :fecha)

     output = ServicioList.new(Servicio.all, view_context) # Aquí instancio el documento pdf
     respond_to do |format|
        format.pdf{
        send_data output.render, :filename => "serviciosList.pdf", :type => "application/pdf", 
      :disposition => "inline" # este parámetro permite ver el documento pdf en linea.
      }
        format.html #{ render :text => "<h1>Use .pdf</h1>".html_safe }
        format.json { render json: @servicios  }
     end
  end
  
  def estado # metodo para el boton que me cambia el estado del servicio al ser termanado el servicio prestado
     @estado = Estado.find_by_nombre("Terminado")
     @servicio.estado_id = @estado.id
     if @servicio.save
       ServicioMailer.registration_contacto(@servicio).deliver # para enviar correo
     end
     @servicios = @solicitud_servicio.servicios.all
     respond_to do |format|
      format.html { redirect_to solicitud_servicio_servicios_path(@solicitud_servicio), :notice => "Servicio Terminado con Éxito"}
      format.xml { render :xml => @servicios }
    end
  end
  
  def show
    @servicio = Servicio.find(params[:id])

  end

 
  def new
    @servicio = Servicio.new

  end

 
  def edit
    @servicio = Servicio.find(params[:id])
  end

  
  def create
    @servicio = Servicio.new(params[:servicio])
    @servicio.solicitud_servicio_id = @solicitud_servicio.id
    render :action => :new unless @servicio.save
    
  
  end

 
  def update
    @servicio = Servicio.find(params[:id])
    render :action => :edit unless @servicio.update_attributes(params[:servicio])
    
  end

 
  def destroy
    @servicio = Servicio.find(params[:id])
    @servicio.destroy
  end

  
  def find_solicitudservicio_and_servicio  # filtro de detalle maestro
      @solicitud_servicio = SolicitudServicio.find(params[:solicitud_servicio_id])
      @servicio = Servicio.find(params[:id]) if params[:id]
  end

end
