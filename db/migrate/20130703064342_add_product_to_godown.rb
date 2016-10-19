class AddProductToGodown < ActiveRecord::Migration
  def change
    add_column :godown_items, :product_id, :integer
  end
end
