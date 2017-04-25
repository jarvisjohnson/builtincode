class AddMonthlyCostCentsToWebsites < ActiveRecord::Migration[5.0]
  def change
    add_column :websites, :monthly_cost_cents, :integer, default: 2500
  end
end
