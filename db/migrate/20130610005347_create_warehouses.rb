class CreateWarehouses < ActiveRecord::Migration
  def change
    create_table :warehouses do |t|
      t.string :name
      t.string :pre_code
      t.integer :status, :default => 0

      t.timestamps
    end
  end
end
