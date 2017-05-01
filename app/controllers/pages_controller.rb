class PagesController < ApplicationController
  
  def welcome
    render action: "welcome", layout: "welcome_layout"
  end
  
  def terms
    render action: "terms"
  end
  
  def privacy
    render action: "privacy"
  end
  
  # def swish_privacy
  #   render action: "swish_privacy"
  # end
  
end
