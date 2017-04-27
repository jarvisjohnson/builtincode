class PagesController < ApplicationController
  def welcome
    render action: "welcome", layout: "welcome_layout"
  end
end
