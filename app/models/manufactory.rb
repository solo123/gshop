class Manufactory < ActiveRecord::Base
  has_and_belongs_to_many :customers
	has_many :issues
end
