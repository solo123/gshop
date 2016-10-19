class AddInfoToSalesSheets < ActiveRecord::Migration
  def change
    add_column :sales_sheets, :info, :string
    add_column :sales_sheet_items, :description, :string
  end
end
