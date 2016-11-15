class Product < ActiveRecord::Base
  has_one :product_price
  scope :show_order, -> { order 'catalog, status, brand, model' }
  scope :search_by_name, -> (q) { where(['full_name like ? or catalog like ?', "%#{q}%"]) }
  scope :on_sale, -> {where('status > 0')}

  def product_short_name_fullname
    "#{self.catalog} - #{self.short_name} #{self.full_name}"
  end
end
