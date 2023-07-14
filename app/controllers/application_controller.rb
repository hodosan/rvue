class ApplicationController < ActionController::Base

  
  before_action :permit_params, if: :devise_controller?

  protected

  def permit_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
