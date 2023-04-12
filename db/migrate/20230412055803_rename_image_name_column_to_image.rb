class RenameImageNameColumnToImage < ActiveRecord::Migration[6.0]
  def change
    rename_column :spots, :image_name, :image
  end
end
