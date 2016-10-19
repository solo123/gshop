class AddActualPriceToSalesItem < ActiveRecord::Migration
  def change
    add_column :sales_sheet_items, :actual_amount, :decimal
		add_column :sales_sheets, :discount_rate, :decimal
  end
end
