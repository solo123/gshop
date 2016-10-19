class AddWarehouseToStock < ActiveRecord::Migration
  def change
    add_column :stocks, :warehouse_id, :integer 
  end
end
