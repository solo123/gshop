class SalesSheetItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :sales_sheet
  belongs_to :product_data, :polymorphic => true
  belongs_to :serial_product
	before_save :caculate_amount

	private
	  def caculate_amount
			if self.price && self.quantity
				self.amount = self.price * self.quantity
			else
				self.amount = 0
			end
			true
		end

end
