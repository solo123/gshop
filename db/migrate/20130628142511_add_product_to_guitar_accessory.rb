class AddProductToGuitarAccessory < ActiveRecord::Migration
  def change
    add_column :guitars, :product_id, :integer
    add_column :accessories, :product_id, :integer
    add_column :sales_sheet_items, :product_id, :integer
    add_column :serial_products, :product_id, :integer
    add_column :stock_taking_items, :product_id, :integer
    add_column :stocks, :product_id, :integer
    add_column :stock_journals, :product_id, :integer
  end
end
