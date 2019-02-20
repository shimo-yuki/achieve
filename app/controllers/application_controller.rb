class ApplicationController < ActionController::Base
before_action :configure_permitted_pa​​rameters, if: :devise_controller?
  def  configure_permitted_pa​​rameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
   end
end
