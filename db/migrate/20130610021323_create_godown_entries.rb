class CreateGodownEntries < ActiveRecord::Migration
  def change
    create_table :godown_entries do |t|
      t.date :godown_date
      t.integer :manufactory_id
      t.integer :from_warehouse_id
      t.integer :to_warehouse_id
      t.string :info
      t.integer :total_quantity, :default => 0
      t.integer :operator
      t.integer :status, :default => 0

      t.timestamps
    end
  end
end
