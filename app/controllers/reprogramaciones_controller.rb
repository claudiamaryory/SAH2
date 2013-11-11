class ReprogramacionesController < ApplicationController
 load_and_authorize_resource :only => [:new, :edit, :destroy] #codigo de permiso de usuario adm
  def index
    @reprogramaciones = Reprogramacion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reprogramaciones }
    end
  end

  
  def show
    @reprogramacion = Reprogramacion.find(params[:id])
  end

  
  def new
    @reprogramacion = Reprogramacion.new
  end

  def edit
    @reprogramacion = Reprogramacion.find(params[:id])
  end

  def create
    @reprogramacion = Reprogramacion.new(params[:reprogramacion])
    render :action => :new unless @reprogramacion.save
      end

 
  def update
    @reprogramacion = Reprogramacion.find(params[:id])
    render :action => :edit unless @reprogramacion.update_attributes(params[:reprogramacion])
     
  end

  def destroy
    @reprogramacion = Reprogramacion.find(params[:id])
    @reprogramacion.destroy

  end
end
