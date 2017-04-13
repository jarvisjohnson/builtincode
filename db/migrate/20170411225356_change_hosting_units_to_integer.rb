class ChangeHostingUnitsToInteger < ActiveRecord::Migration[5.0]
  def change
    change_column(:clients, :hosting_units, :integer)
  end
end
