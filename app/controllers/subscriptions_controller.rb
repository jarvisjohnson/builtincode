class SubscriptionsController < ApplicationController

  skip_before_action :verify_authenticity_token, only: :webhook

  before_action :authenticate_client!, except: :webhook
  before_action :set_description, except: :webhook
  before_action :set_plan, except: :webhook


  def new
  end

  def create

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    # https://stripe.com/docs/subscriptions/quantities
    # Use base plan of $1 
    # Use quantity to represent multiples, i.e. $25 = 25 units
    # We'll use hosting_units for this, set on the client
    subscription = Stripe::Subscription.create(
      customer: customer,
      items: [
        {
          plan: "basic-web-hosting",
          quantity: current_client.hosting_units,
        },
      ]
    )

    current_client.assign_attributes(
      :paid => true, 
      :stripe_account_id => customer.id,
      :stripe_subscription_id => subscription.id
      )

    current_client.save

    flash[:notice] = "Thank you; Your subscription payment has cleared and your membership has been updated"
    redirect_to root_path, notice: "Thank you; Your subscription payment has cleared and your membership has been updated"    

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to client_path(current_client.id)
  end

  def update

    subscription = StripeTool.update_membership(
      customer: current_client.stripe_account_id,
      plan: @plan
    )

    current_client.assign_attributes(
      :paid => true, 
      :stripe_subscription_id => subscription.id
      )

    current_client.save

    flash[:notice] = "Thank you; Your subscription payment has cleared and your membership has been updated"
    redirect_to client_path(current_client.id), notice: "Thank you; Your subscription payment has cleared and your membership has been updated"    

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to client_path(current_client.id)
  end

  def thanks
  end    

  private

    def set_plan
      #TODO: this needs to be dynamic for each client; should be creating plans with the API based on inputs I have as Admin 
      @plan = 'test_plan'
    end

    def set_description
      @description = "Some amazing product"
    end    

end