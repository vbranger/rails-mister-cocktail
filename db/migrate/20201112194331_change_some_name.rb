class ChangeSomeName < ActiveRecord::Migration[6.0]
  def change
    rename_column :doses, :description, :quantity
  end
end
