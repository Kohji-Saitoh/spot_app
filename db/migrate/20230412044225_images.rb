class Images < ActiveRecord::Migration[6.0]
  def up
    add_column :spots, :image_name, :string
  end
end
