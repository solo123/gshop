class CreateSalesSheetItems < ActiveRecord::Migration
  def change
    create_table :sales_sheet_items do |t|
      t.integer :sales_sheet_id
      t.string :product_data_type
      t.integer :product_data_id
      t.integer :quantity, :default => 0
      t.decimal :price, :precision => 8, :scale => 2, :default => 0
      t.decimal :amount, :precision => 8, :scale => 2, :default => 0

      t.timestamps
    end
  end
end
