class StockTakingsController < ResourcesController
  def get_stock
    load_object
    @object.warehouse.stocks.where('on_hand != 0').each do |stock|
			next unless stock.product_id
      item = @object.stock_taking_items.where(product_id: stock.product_id).first
      unless item
        item = @object.stock_taking_items.build
        item.product = stock.product
      end
      item.full_name = item.product.full_name
      item.on_hand = stock.on_hand
      item.save
    end
    redirect_to @object 
  end
  def entering
    load_object
    @object.stock_taking_items.where(:status => 0).each do |item|
      if item.on_hand != item.quantity && item.product
        stock = @object.warehouse.stocks.where(product_id: item.product_id).first
        unless stock
          stock = @object.warehouse.stocks.build
          stock.product = item.product
          stock.on_hand = 0
        end
        journal = stock.stock_journals.build
        journal.stock_before = stock.on_hand
        journal.stock_change = item.on_hand - item.quantity
        journal.stock_after = stock.on_hand = item.quantity
        journal.stock_order = item
        stock.save
        journal.save
      end
      item.status = 1
      item.save
    end
    @object.status = 1
    @object.save
    redirect_to @object
  end
  def save_quantity
    load_object
    params[:items].each do |item|
      sti = StockTakingItem.find(item[0])
      sti.quantity = item[1].to_i
      sti.save
    end

    redirect_to @object
  end
	private
		def stock_taking_params
			params.require(:stock_taking).permit(:info, :status, :warehouse_id)
    end
end
