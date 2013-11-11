class ServicioList < Prawn::Document

  #Hay dos formas de hacerlo 1- con el constructor de la clase o  2- con este Método principal que construye el  documento pdf y se invoca con el contructor en el controller

  # 1- Método constructor de la clase Orderlist 

    def initialize(servicios1, view)
       super()
       logo 
       @servicios = servicios1
       @vista = view
       servicio_details
    end

    # 2- Método que reemplaza el constructor(initialize se elimina), pero implica que en el controller de la clase se invoque así:
    #  output = OrderList.new.to_pdf(@orders,view_context) -> es más larga esta forma.
    # y también se debe cambiar el formato quitandole el método render así:
    # format.pdf{
    #      send_data output, :filename => "orderslist.pdf", :type => "application/pdf", :disposition => "inline"
    #    }
    def to_pdf(orders, view)
      logo
      @servicios = servicios
      @vista = view
      servicio_details
      render
    end

    #Método para definir el logo con su ubicación así como el título del reporte  
    def logo
      logopath = "#{Rails.root}/app/assets/images/logo.png"
      image logopath, :width => 200, :height => 100
      move_down 10
      draw_text "Listado de Servicios", :at => [150, 575], size: 22
      text ""
    end

    #Método para dar formato a la salida de los registros
    def precision(num)
      @vista.number_with_precision(num, :locale => :es ,:precision => 6, :separator => ",", :delimiter => '.')
    end

    #Método para almacenar y mostrar los registros del detalle de la servicio
    def servicio_item_rows
      [["Fecha", "Hora", "empleado", "solicitud de servicio", "cliente", "estado"]] +
      @servicios.map do |servicio|
        [ "#{servicio.fecha} ",  
        "#{servicio.hora} ",  
        "#{servicio.empleado.nombre}  #{servicio.empleado.apellido} ",
        "#{servicio.solicitud_servicio.ofertado.nombre} ",
        "#{servicio.cliente.nombre}  #{servicio.cliente.apellido} ",
        "#{servicio.estado.nombre} ",
         ]
      end
    end

    #Método que imprime la tabla de las servicioes que hay
    def servicio_details
      move_down 80
      table servicio_item_rows, :width => 540 do
        row(0).font_style = :bold
        columns(1..6).align = :right
        self.header = true
        self.column_widths = {0 => 90, 1 => 90, 2 => 90, 3 => 90, 4 => 90, 5 => 90}
      end
    end

end