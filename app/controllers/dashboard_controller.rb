class DashboardController < ApplicationController
  before_action :authenticate_client!
  before_action :set_client, only: [:show, :edit, :update, :destroy, :index]

  def index

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
      @client_currency = @client.billing_currency
    end  

end