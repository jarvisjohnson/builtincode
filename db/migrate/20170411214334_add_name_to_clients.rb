class AddNameToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :contact_name, :string
    add_column :clients, :business_name, :string
  end
end
