class AddSubscribedToClient < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :subscribed, :boolean, default: false
    add_column :clients, :receipt_number, :string
  end
end
