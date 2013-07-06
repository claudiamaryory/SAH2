
class ClientesController < ApplicationController
    
  autocomplete :barrio, :nombre, :full => true

def index#codigo de buscador
    @nrp = (params[:registro] != nil)? params[:registro].to_i : 2 # seleccionar el numero de registros

    if ((@nrp) <= 0)
       @nrp = 3
    end

    @clientes = Cliente.search(params[:search]).paginate(:per_page=>(@nrp), :page=>params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @clientes }
    end
  end

  def show
      @cliente = Cliente.find(params[:id])
  end

  def new
      @cliente = Cliente.new
  end

  def edit
      @cliente = Cliente.find(params[:id])
  end

  def create
      @cliente = Cliente.new(params[:cliente])
     render :action => :new unless @cliente.save
     @clientes = Cliente.all
  end

  def update
      @cliente = Cliente.find(params[:id])
      render :action => :edit unless @cliente.update_attributes(params[:cliente])
  end
  def destroy
      @cliente = Cliente.find(params[:id])
      @cliente.destroy
      @clientes = Cliente.all
  end
  
end
