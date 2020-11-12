class AddPictureUrlToCocktails < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails, :picture_url, :string
  end
end
