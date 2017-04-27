class AddLiveStatusToWebsite < ActiveRecord::Migration[5.0]
  def change
    add_column :websites, :live_status, :string, default: "live"
  end
end
