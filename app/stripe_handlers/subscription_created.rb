class SubscriptionCreated
  def call(event)
    client = Client.find_by(stripe_account_id: (event.data.object.customer))
    client.update_attributes(
      :role => 'member', 
      :subscription_status => 'paid', 
      :receipt_number => event.data.object.id,
      :paid_til => Time.now.in_time_zone(ENV["time_zone"]) + 1.years,
      :last_payment_method => 'stripe'
      )   
    client.listing.update_attribute(:approved, true)
    Notification.subscription_renewed(client).deliver_now!
  end  
end
