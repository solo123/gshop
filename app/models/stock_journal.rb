class StockJournal < ActiveRecord::Base
  belongs_to :product
  belongs_to :stock
  belongs_to :stock_order, :polymorphic => true
end
