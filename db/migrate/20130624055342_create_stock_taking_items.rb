class CreateStockTakingItems < ActiveRecord::Migration
  def change
    create_table :stock_taking_items do |t|
      t.integer :stock_taking_id
      t.string :product_data_type
      t.integer :product_data_id
      t.string :full_name
      t.string :catalog
      t.integer :on_hand, :default => 0
      t.integer :quantity, :default => 0
      t.integer :status, :default => 0

      t.timestamps
    end
  end
end
