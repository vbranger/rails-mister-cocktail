class RenameColumnPictureUrlToGlassType < ActiveRecord::Migration[6.0]
  def change
    rename_column :cocktails, :picture_url, :glass_type
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
