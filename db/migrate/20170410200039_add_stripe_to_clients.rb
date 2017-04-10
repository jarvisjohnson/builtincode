class AddStripeToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :stripe_account_id, :string
    add_column :clients, :paid, :boolean
    add_column :clients, :stripe_subscription_id, :string
    add_column :clients, :hosting_units, :string
    add_column :clients, :billing_currency, :string, default: 'AUD'
  end
end
