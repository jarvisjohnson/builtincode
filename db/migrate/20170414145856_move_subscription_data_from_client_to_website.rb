class MoveSubscriptionDataFromClientToWebsite < ActiveRecord::Migration[5.0]
  def change
    # Add to Website
    # add_column :websites, :stripe_account_id, :string
    add_column :websites, :paid, :boolean
    add_column :websites, :stripe_subscription_id, :string
    add_column :websites, :hosting_units, :string
    # add_column :websites, :billing_currency, :string, default: 'AUD'

    #remove from client
    # remove_column :clients, :stripe_account_id, :string
    remove_column :clients, :paid, :boolean
    remove_column :clients, :stripe_subscription_id, :string
    remove_column :clients, :hosting_units, :string
    # remove_column :clients, :billing_currency, :string, default: 'AUD'    
  end
end
