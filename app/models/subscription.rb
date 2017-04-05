class Subscription < ActiveRecord::Base
  include Koudoku::Subscription

  
  belongs_to :client
  belongs_to :coupon

end
