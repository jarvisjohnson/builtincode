class CreateWebsites < ActiveRecord::Migration[5.0]
  def change
    drop_table :plans
    drop_table :subscriptions
    drop_table :coupons
    create_table :websites do |t|
      t.belongs_to :client, foreign_key: true
      t.references :features
      t.integer :billing_units, default: 30
      t.string :name
      t.string :app_type
      t.boolean :ssl, default: false
      t.boolean :cdn, default: false

      t.timestamps
    end
    create_join_table :clients, :websites do |t|
      t.index :client_id
      t.index :website_id
    end     
  end
end
