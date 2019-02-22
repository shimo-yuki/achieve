class ApplicationController < ActionController::Base
before_action :configure_permitted_pa​​rameters, if: :devise_controller?

  def after_sign_out_path_for(resource)
      blogs_path
    end

  def  configure_permitted_pa​​rameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :icon] )
   end
end
