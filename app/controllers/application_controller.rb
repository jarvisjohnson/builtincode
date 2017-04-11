class ApplicationController < ActionController::Base
  # before_action :authenticate_client!
  protect_from_forgery with: :exception

  # https://github.com/plataformatec/devise/wiki/How-To:-Create-custom-layouts
  layout :layout_by_resource

  private

  def layout_by_resource
    if devise_controller?
      "clients"
    else
      "application"
    end
  end  

end
