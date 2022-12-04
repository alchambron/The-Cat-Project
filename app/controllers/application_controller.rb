class ApplicationController < ActionController::Base
  before_action :configure_devise_parameters, if: :devise_controller?
  before_action :get_cart

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:first_name, :last_name, :birth_date, :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:first_name, :last_name, :birth_date, :email, :password, :password_confirmation)
    end
  end

  def get_cart
    @cart = Cart.get(session[:cart])
  end
end
