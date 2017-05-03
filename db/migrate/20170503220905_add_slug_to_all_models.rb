class AddSlugToAllModels < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :slug, :string
    add_column :websites, :slug, :string
    add_index :clients, :slug, unique: true
    add_index :websites, :slug, unique: true
  end
end
