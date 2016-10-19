class CreateSalesSheets < ActiveRecord::Migration
  def change
    create_table :sales_sheets do |t|
      t.integer :customer_id
      t.integer :warehouse_id
      t.integer :operator_id
      t.integer :total_items, :default => 0
      t.decimal :total_amount, :precision => 8, :scale => 2, :default => 0
      t.decimal :additional_fee, :precision => 8, :scale => 2, :default => 0
      t.decimal :discount, :precision => 8, :scale => 2, :default => 0
      t.decimal :actual_amount, :precision => 8, :scale => 2, :default => 0
      t.integer :status, :default => 0

      t.timestamps
    end
  end
end
