class CreateSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :spots do |t|
      t.string :name, null: false
      t.text :content, null: false
      t.integer :region_id, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
