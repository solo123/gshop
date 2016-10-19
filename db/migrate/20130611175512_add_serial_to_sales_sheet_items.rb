class AddSerialToSalesSheetItems < ActiveRecord::Migration
  def change
    add_column :sales_sheet_items, :serial_product_id, :integer
    add_column :sales_sheet_items, :serial_number, :string
  end
end
