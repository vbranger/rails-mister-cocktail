class AddColorToIngredients < ActiveRecord::Migration[6.0]
  def change
    add_column :ingredients, :color, :string
  end
end
