class HomeController < ApplicationController
  skip_before_action :authenticate_client!, :only => [:index]
  def index
  end
end