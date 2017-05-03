class SubscriptionInvoicePaid
  
  def call(event)
    # Get admins
    admin = ::Client.where(admin: true)

    # Get Client
    client = ::Client.find_by(stripe_account_id: (event.data.object.customer))

    # update client record
    client.update_attributes(
      :subscribed => true, 
      :receipt_number => event.data.object.id,
      ) 
    
    # notify the client
    SubscriptionMailer.subscription_invoice_paid(client).deliver_later

    # notify admins
    admin.each do |admin|
      SubscriptionMailer.subscription_invoice_paid(admin).deliver_later
    end

  end

end
