class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :password_confirmation, :surname, :name, :surname_furigana, :name_furigana, :birthday])
  end
end

