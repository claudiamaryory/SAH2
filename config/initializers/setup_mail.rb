ActionMailer::Base.smtp_settings = {
  :address  => "smtp.gmail.com",
  :port     => 587,
  :domain   => "local",
  :user_name => "claudiamaryory@misena.edu.co",#aca coloco el correo de la empresa
  :password => "zamircerezo",#clave del correo de la empresa
  :authentication => "plain",
  :enable_starttls_auto => true

}
  ActionMailer::Base.default_url_options[:host] = "sah.herokuapp.com"
