class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :brand
      t.string :model
      t.string :full_name
      t.string :catalog
      t.integer :title_photo_id
      t.integer :status, :default => 0

      t.timestamps
    end
  end
end
