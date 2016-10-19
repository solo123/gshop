class SalesSheetsController < ResourcesController
  autocomplete :customer, :phone, :extra_data => [:name, :title], :display_value => :customer_phone_name
  autocomplete :product, :name, scopes: [:on_sale], :extra_data => [:catalog, :full_name], :full => true, :column_name => "full_name", limit: 80
  def calculate
    load_object
    @object.sales_sheet_items.each do |item|
      unless item.serial_number.blank?
        sp = SerialProduct.where(:serial_number => item.serial_number).first
        if sp && sp.stock && sp.stock.warehouse_id == @object.warehouse_id
          item.serial_product = sp
          item.serial_number = nil
          item.product = item.serial_product.stock.product
          item.quantity = 1
        end
      end
      if item.product
        if item.serial_product && item.product != item.serial_product.product
          item.serial_product = nil
        end
        if item.product.product_price
					if !item.price || item.price == 0 
            item.price = item.product.product_price.price
          end
        end
        item.description = item.product.full_name if !item.description || item.description.empty?
        item.amount = item.quantity * item.price
        item.save
      end
    end
    @object.total_items = @object.sales_sheet_items.sum(:quantity)
    @object.total_amount = @object.sales_sheet_items.sum(:amount)
    @object.additional_fee = 0 unless @object.additional_fee
    if @object.actual_amount && @object.actual_amount > 0
      @object.discount = @object.total_amount  - @object.actual_amount
    else
      @object.actual_amount = @object.total_amount - @object.additional_fee
    end
    @object.save
    redirect_to @object
  end
  def print
    load_object
    render 'print', :layout => 'print_layout'
  end
  def entering
    load_object
    if @object.status == 0
      warehouse = @object.warehouse
      @object.sales_sheet_items.each do |item|
        stock = warehouse.stocks.where(:product_id => item.product_id).first
        unless stock
          stock = warehouse.stocks.build
          stock.product = item.product
          stock.on_hand = 0
        end
        journal = stock.stock_journals.build
        journal.stock_before = stock.on_hand
        journal.stock_change = 0 - item.quantity
        journal.stock_after = stock.on_hand = journal.stock_before + journal.stock_change
        journal.stock_order = item
        stock.save
        @object.operator = current_employee
        @object.status = 1
        @object.save
      end
    else
      flash[:error] = 'Wrong status!'
    end
    redirect_to @object
  end
  def new
    @object = SalesSheet.first
    if @object.status == 0 && @object.total_amount == 0
      @object.created_at = DateTime.now
      @object.save
    else
      @object = SalesSheet.new
      @object.warehouse_id = 1
      @object.operator = current_employee
      @object.save
    end
    redirect_to @object
  end
  def update
    load_object
    params.permit!
    @object.attributes = params[:sales_sheet]
    @object.save
    calculate
  end
  def calc_discount
    SalesSheet.where('discount_rate is null').each do |ss|
      ss.calc_discount
    end
    redirect_to action: :index
  end

	private
		def sales_sheet_params
			params.require(:sales_sheet).permit(:actual_amount, :additional_fee, :customer_id, :info)
		end
end
