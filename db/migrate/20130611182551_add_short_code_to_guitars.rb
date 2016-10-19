class AddShortCodeToGuitars < ActiveRecord::Migration
  def change
    add_column :guitars, :short_code, :string
  end
end
