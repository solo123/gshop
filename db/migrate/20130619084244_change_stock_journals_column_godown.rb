class ChangeStockJournalsColumnGodown < ActiveRecord::Migration
  def change
    rename_column :stock_journals, :stock_godown, :stock_change
    add_column :stock_journals, :stock_order_type, :string
    add_column :stock_journals, :stock_order_id, :integer
  end
end
