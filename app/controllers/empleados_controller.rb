class EmpleadosController < ApplicationController
 load_and_authorize_resource :only => [:new, :edit, :destroy] #codigo de permiso de usuario adm
 def index # codigo del buscador y la paginacion
    @nrp = (params[:registro] != nil)? params[:registro].to_i : 2 # seleccionar el numero de registros

    if ((@nrp) <= 0)
       @nrp = 3
    end

    @empleados = Empleado.search(params[:search]).paginate(:per_page=>(@nrp), :page=>params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @barrios }
    end
  end

  def show
      @empleado = Empleado.find(params[:id])
  end

  def new
      @empleado = Empleado.new
  end

  def edit
      @empleado = Empleado.find(params[:id])
  end

  def create
      @empleado = Empleado.new(params[:empleado])
      render :action => :new unless @empleado.save
      @empleados = Empleado.all #codigo del contador de la paginación
  end

  def update
      @empleado = Empleado.find(params[:id])
      render :action => :edit unless @empleado.update_attributes(params[:empleado])
  end
  def destroy
      @empleado = Empleado.find(params[:id])
      @empleado.destroy
      @empleados = Empleado.all#codigo del contador de la paginación
  end
  
end
