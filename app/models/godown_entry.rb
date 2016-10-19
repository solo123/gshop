class GodownEntry < ActiveRecord::Base
  has_many :godown_items, :dependent => :destroy
  belongs_to :from_warehouse, :class_name => 'Warehouse'
  belongs_to :to_warehouse, :class_name => 'Warehouse'
  belongs_to :manufactory
end
