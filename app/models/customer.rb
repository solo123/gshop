class Customer < ActiveRecord::Base
#  has_and_belongs_to_many :manufactories
  has_many :sales_sheets
  def customer_phone_name
    "#{self.phone} #{self.name}#{self.title}"
  end
end
