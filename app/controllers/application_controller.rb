class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  private
  def not_authenticated
  	redirect_to login_url, :alert => "primero debes registrarte para ingresar"
  end
end
