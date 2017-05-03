class SubscriptionsController < ApplicationController

  before_action :set_website, except: :webhook
  skip_before_action :verify_authenticity_token, only: :webhook

  before_action :authenticate_client!, except: :webhook
  before_action :set_description, except: :webhook
  before_action :check_if_current_stripe_account


  def new
  end

  def create

    customer = @current_account ? 
      current_client.stripe_account_id :
      Stripe::Customer.create(
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
          plan: "web-hosting-#{@website.client.billing_currency.downcase}",
          # We want this in 'billing units' i.e. 1 unit - $1
          quantity: (@website.monthly_cost_cents/100)
        },
      ]
    )

    current_client.assign_attributes(
      :stripe_account_id => customer.id,
      ) if !@current_account

    current_client.assign_attributes(
      :subscribed => true
      )

    current_client.save    

    @website.assign_attributes(
      :paid => true, 
      :stripe_subscription_id => subscription.id
      )

    @website.save    

    flash[:notice] = "Thank you; Your subscription payment has cleared and your membership has been updated"
    redirect_to dashboard_index_path, notice: "Thank you; Your subscription payment has cleared and your membership has been updated"    

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to client_path(current_client.uuid)
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
    redirect_to client_path(current_client.uuid), notice: "Thank you; Your subscription payment has cleared and your membership has been updated"    

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to client_path(current_client.uuid)
  end

  def thanks
  end    

  private

    def set_website
      #TODO: this needs to be dynamic for each website; should be creating plans with the API based on inputs I have as Admin 
      @website = Website.find(params[:website_id])
    end

    def set_description
      @description = "Some amazing product"
    end   

    def check_if_current_stripe_account
      @current_account = current_client.stripe_account_id?
    end 

end