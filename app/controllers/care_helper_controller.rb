class CareHelperController < ApplicationController
  
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
