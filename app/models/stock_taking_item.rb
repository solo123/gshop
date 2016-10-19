class StockTakingItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :stock_taking
  belongs_to :product_data, :polymorphic => true

  default_scope { order('catalog, full_name') }
end
