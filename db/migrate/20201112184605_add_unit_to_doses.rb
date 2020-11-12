class AddUnitToDoses < ActiveRecord::Migration[6.0]
  def change
    add_reference :doses, :unit, null: false, foreign_key: true
  end
end
