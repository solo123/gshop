class CreateGuitars < ActiveRecord::Migration
  def change
    create_table :guitars do |t|
      t.string :brand
      t.string :guitar_type
      t.string :model
      t.decimal :price
      t.string :info
      t.integer :title_photo_id
      t.integer :status, :default => 0

      t.timestamps
    end
  end
end
