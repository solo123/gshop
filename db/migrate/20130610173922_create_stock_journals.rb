class CreateStockJournals < ActiveRecord::Migration
  def change
    create_table :stock_journals do |t|
      t.integer :stock_id
      t.integer :stock_before
      t.integer :stock_godown
      t.integer :stock_after

      t.timestamps
    end
  end
end
