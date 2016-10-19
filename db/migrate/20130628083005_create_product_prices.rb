class CreateProductPrices < ActiveRecord::Migration
  def change
    create_table :product_prices do |t|
      t.integer :product_id
      t.decimal :price
      t.integer :godown_count, :default => 0
      t.decimal :godown_amount, :default => 0
      t.decimal :godown_fee, :default => 0
      t.decimal :godown_price, :default => 0
      t.integer :status, :default => 0

      t.timestamps
    end
  end
end
