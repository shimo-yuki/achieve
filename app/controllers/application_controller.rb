class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_out_path_for(resource)
      blogs_path
  end

protected

  def  configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :icon] )
  end
end
