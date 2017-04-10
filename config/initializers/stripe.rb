Rails.configuration.stripe = {
  :publishable_key => ENV['BUILT_STRIPE_PUBLISHABLE_KEY'],
  :secret_key      => ENV['STRIPE_SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]

StripeEvent.configure do |events|

  events.subscribe 'customer.subscription.deleted' , SubscriptionDeleted.new

  events.subscribe 'invoice.payment_succeeded', SubscriptionRenewed.new

  events.all do |event|
    events.all BillingEventLogger.new(Rails.logger)
    # events.subscribe 'customer.created', CustomerCreated.new
  end
end