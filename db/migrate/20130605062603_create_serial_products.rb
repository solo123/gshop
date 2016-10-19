class CreateSerialProducts < ActiveRecord::Migration
  def change
    create_table :serial_products do |t|
      t.string :serial_number
      t.string :product_name
      t.string :product_model
      t.integer :title_photo_id
      t.integer :production_batch_id
      t.string :product_data_type
      t.integer :product_data_id
      t.integer :status, :default => 0

      t.timestamps
    end
  end
end
