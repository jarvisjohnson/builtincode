class DashboardController < ApplicationController
  before_action :authenticate_client!
  before_action :set_client, only: [:show, :edit, :update, :destroy, :index]
 

  def index

    # Facebook Oauth doesn't always return email - demand to enter
    if @no_email
      flash[:success] = "Successfully authorised from Facebook account"
      flash[:error] = "Facebook could not provide your email; please enter here"
      redirect_to edit_client_registration_path(@client)
    end
    

    if @subscribed

      # Talk to Stripe API to retreive their current subscription      

      @subscription = Stripe::Subscription.retrieve(@client.stripe_subscription_id)
      @status = @subscription.status

      # Talk to Stripe API to retrieve their invoices 

      @invoices = Stripe::Invoice.list(:customer => @client.stripe_account_id)


    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = current_client
      @subscribed = @client.stripe_subscription_id?
      @no_email = @client.email.exclude?('@')
      @client_currency = @client.billing_currency
    end  

end