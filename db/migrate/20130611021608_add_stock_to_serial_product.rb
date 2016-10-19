class AddStockToSerialProduct < ActiveRecord::Migration
  def change
    add_column :serial_products, :stock_id, :integer 
  end
end
