class CreateFeatures < ActiveRecord::Migration[5.0]
  def change
    create_table :features do |t|
      t.belongs_to :website, foreign_key: true
      t.integer :billing_units, default: 2
      t.integer :quantity, default: 1
      t.string :name

      t.timestamps
    end
    create_join_table :websites, :features do |t|
      t.index :website_id
      t.index :feature_id
    end   
  end
end
