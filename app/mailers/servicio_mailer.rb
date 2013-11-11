class ServicioMailer < ActionMailer::Base
  default from: 'claudiamaryory@misena.edu.co' #aca va el correo de la empresa
  
  def registration_contacto(servicio)
    	@servicio = servicio#creo un  objeto para recuperar la informacion del foormulario
    	@clientecorreo = @servicio.cliente.email 
        mail(:to => @clientecorreo, :subject => "Prueba envio de encuesta satisfacción  - aplicativo SAH ")
      # este es unn has para definir :to = a quien se envía el email, :subject = asunto del email, :from = el correo desde el cual se enviara el email.
  end
end
