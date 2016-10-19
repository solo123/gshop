class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :product_data_type
      t.integer :product_data_id
      t.integer :on_hand, :default => 0
      t.string :info
      t.integer :title_photo_id
      t.date :last_buy_date
      t.date :sold_out_date

      t.timestamps
    end
  end
end
