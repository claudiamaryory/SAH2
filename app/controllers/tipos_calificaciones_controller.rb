class TiposCalificacionesController < ApplicationController
load_and_authorize_resource :only => [:new, :edit, :destroy] #codigo de permiso de usuario adm
  def index
    @tipos_calificaciones = TipoCalificacion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tipos_calificaciones }
    end
  end

  
  def show
    @tipo_calificacion = TipoCalificacion.find(params[:id])

    
  end

  
  def new
    @tipo_calificacion = TipoCalificacion.new

    
  end

  # GET /tipos_calificaciones/1/edit
  def edit
    @tipo_calificacion = TipoCalificacion.find(params[:id])
  end

  
  def create
    @tipo_calificacion = TipoCalificacion.new(params[:tipo_calificacion])
  render :action => :new unless @tipo_calificacion.save
    
  end

  
  def update
    @tipo_calificacion = TipoCalificacion.find(params[:id])
      render :action => :edit unless @tipo_calificacion.update_attributes(params[:tipo_calificacion])
    
  end

  
  def destroy
    @tipo_calificacion = TipoCalificacion.find(params[:id])
    @tipo_calificacion.destroy
  end
end
