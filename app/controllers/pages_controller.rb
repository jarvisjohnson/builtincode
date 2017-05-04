class PagesController < ApplicationController

  def welcome
    render action: "welcome", layout: "welcome_layout"

    prepare_meta_tags(title: "Built in Code")
  end
  
  def terms
    render action: "terms"

    prepare_meta_tags(title: "Terms & Conditions")     
  end
  
  def privacy
    render action: "privacy"

    prepare_meta_tags(title: "Privacy Policy")
  end  

end
