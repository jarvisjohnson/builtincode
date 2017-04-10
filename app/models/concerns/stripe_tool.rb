module StripeTool
  # Generous help from: https://rails.devcamp.com/ruby-gem-walkthroughs/payment/how-to-implement-subscriptions-in-stripe

  # Create the stripe customer
  def self.create_customer(email, stripe_token)
    Stripe::Customer.create(
      email: email,
      source: stripe_token
    )
  end

  # Create the stripe membership on the customer
  def self.create_membership(customer, plan, addons)
    
    Stripe::Subscription.create(
      customer: customer,
      plan: plan,
      trial_end: trial_end
    )
  end


  def self.update_membership(customer, plan, addons)

    Stripe::Subscription.create(
      customer: customer,
      plan: plan,
      trial_end: trial_end
    )
  end    

end