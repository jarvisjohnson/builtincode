class AddOmniauthToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :provider, :string
    add_column :clients, :uid, :string
  end
end
