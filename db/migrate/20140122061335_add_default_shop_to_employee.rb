class AddDefaultShopToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :default_shop_id, :integer
  end
end
