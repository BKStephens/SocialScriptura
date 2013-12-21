class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_devise_params, if: :devise_controller?
  
  def configure_devise_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      user_params(u)
    end

    devise_parameter_sanitizer.for(:account_update) do |u|
      user_params(u)
    end
  end

  private 
  def user_params(params)
    params.permit(:user_name, :full_name, :denomination, :church, :email, :password, :password_confirmation, :current_password)
  end
end
