class SerialProduct < ActiveRecord::Base

  has_many :photos, :as => :photo_data, :dependent => :destroy

  belongs_to :product_data, :polymorphic => true  
  belongs_to :product
  belongs_to :stock
end
