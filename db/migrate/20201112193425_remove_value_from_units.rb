class RemoveValueFromUnits < ActiveRecord::Migration[6.0]
  def change
    remove_column :units, :value, :integer
  end
end
