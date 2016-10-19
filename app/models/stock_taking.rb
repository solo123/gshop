class StockTaking < ActiveRecord::Base
  belongs_to :warehouse
  has_many :stock_taking_items
end
