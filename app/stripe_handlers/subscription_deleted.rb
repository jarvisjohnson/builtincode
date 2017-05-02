class SubscriptionDeleted
  def call(event)
    client = Client.find_by(stripe_account_id: (event.data.object.customer))
    client.update_attribute(:role, "lapsed")
    client.update_attribute(:subscription_status, "unpaid")
    client.listing.update_attribute(:approved, false)
    Notification.subscription_canceled(client).deliver_later
  end  
end
