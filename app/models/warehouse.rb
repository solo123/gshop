class Warehouse < ActiveRecord::Base
  has_many :stocks
end
