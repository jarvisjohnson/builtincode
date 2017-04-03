class ApplicationController < ActionController::Base
  before_action :authenticate_client!
  protect_from_forgery with: :exception
end
