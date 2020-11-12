class AddValueToUnits < ActiveRecord::Migration[6.0]
  def change
    add_column :units, :value, :float
  end
end
