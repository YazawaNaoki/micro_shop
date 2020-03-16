class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admins_products_path
    when User
      user_path(current_user)
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    @url = request.referer
    if @url.include?("admins")
      new_admin_session_path
    else
      new_user_session_path
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:encrypted_password])
  end

end
