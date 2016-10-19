class GodownItem < ActiveRecord::Base
  belongs_to :godown_entry
  belongs_to :product_data, :polymorphic => true
  belongs_to :product
end
