class ManufactoryCustomers < ActiveRecord::Migration
  def change
    create_table :customers_manufactories, :id => false do |t|
      t.integer :manufactory_id
      t.integer :customer_id
    end
  end
end
