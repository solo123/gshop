class CreateAccessories < ActiveRecord::Migration
  def change
    create_table :accessories do |t|
      t.string :short_code
      t.string :brand
      t.string :name
      t.string :catalog
      t.string :info
      t.decimal :price
      t.integer :title_photo_id

      t.timestamps
    end
  end
end
