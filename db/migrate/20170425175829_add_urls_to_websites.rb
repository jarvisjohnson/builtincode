class AddUrlsToWebsites < ActiveRecord::Migration[5.0]
  def change
    add_column :websites, :production_url, :string
    add_column :websites, :staging_url, :string
  end
end
