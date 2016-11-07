require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception


  def after_sign_in_path_for(current_user)
    if current_user.admin?
      root_path
    else
      conversations_path
    end
  end


  protected

  def configure_permitted_parameters
    added_attrs = [:name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
