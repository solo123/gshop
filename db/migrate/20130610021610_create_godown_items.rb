class CreateGodownItems < ActiveRecord::Migration
  def change
    create_table :godown_items do |t|
      t.integer :godown_entry_id
      t.string :product_data_type
      t.integer :product_data_id
      t.integer :quantity, :default => 0
      t.integer :status, :default => 0

      t.timestamps
    end
  end
end
