class Accessory < ActiveRecord::Base
  belongs_to :product
  def full_name
    "#{brand} #{name}"
  end
end
