class CreateStockTakings < ActiveRecord::Migration
  def change
    create_table :stock_takings do |t|
      t.integer :warehouse_id
      t.string :info
      t.integer :status, :default => 0

      t.timestamps
    end
  end
end
