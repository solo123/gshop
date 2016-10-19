class AddCostToGodownItems < ActiveRecord::Migration
  def change
    add_column :godown_items, :cost, :decimal, :precision => 8, :scale => 2, :default => 0
  end
end
