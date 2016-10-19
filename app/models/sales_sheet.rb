class SalesSheet < ActiveRecord::Base
  has_many :sales_sheet_items
  belongs_to :customer
  belongs_to :warehouse
  belongs_to :operator, :class_name => 'Employee', :foreign_key => 'operator_id'

  default_scope {order('created_at desc')}

  def calc_discount
    return false unless self.total_amount > 0
    if self.discount > 0
      self.discount_rate = 1 - (self.discount + self.additional_fee) / self.total_amount
      self.save
      self.sales_sheet_items.each do |item|
        item.actual_amount = item.amount * self.discount_rate
        item.save
      end
    else
      self.discount_rate = 1
      self.save
      self.sales_sheet_items.each do |item|
        item.actual_amount = item.amount
        item.save
      end
    end
  end
end
