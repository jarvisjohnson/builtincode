class SubscriptionMailer < ApplicationMailer

  def subscription_created(client)
    @message = 'Your membership has been successfully processed. Thank you for your business!'
    @client = client
    mail to: client.email
  end

  def subscription_deleted(client)
    @message = 'Your membership has been canceled.  This could be due to failed payments or manual cancellation.  To restart your membership, please login to your account and update your payment details'
    @client = client
    mail to: client.email
  end

  def subscription_renewed(client)
    @message = 'Your membership has been successfully renewed. Thank you for remaining an active member of Built in Code, we appreciate your continued business!'
    @client = client
    mail to: client.email
  end

  def subscription_reminder(client)
    @message = "Your current membership is going to expire within the month. Built in Code now uses online subscriptions for memberships. Please login to Built in Code.com.au to update your subscription and ensure your membership does not lapse."
    @client = client
    mail to: client.email    
  end

end