class GodownEntriesController < ResourcesController
  def calculate
    load_object
    if @object.status == 0
      
      @object.total_quantity = @object.godown_items.sum(:quantity)
      @object.save
    end
    redirect_to @object
  end
  def entering
    load_object

    if @object.status == 0
      @object.total_quantity = @object.godown_items.sum(:quantity)
      @object.save

      if @object.total_quantity > 0
        @object.godown_items.each do |item|
          if item.status == 0 && item.quantity > 0
            item.status = 1           
            stock = @object.to_warehouse.stocks.find_by_product_id(item.product_id)
            unless stock
              stock = @object.to_warehouse.stocks.build
              stock.product = item.product
            end
            journal = stock.stock_journals.build
            journal.stock_before = stock.on_hand
            journal.stock_change = item.quantity
            journal.stock_after = stock.on_hand = journal.stock_before + journal.stock_change
            journal.stock_order = item
            stock.save
            item.save
          end
        end
        @object.status = 1
        @object.save
      end
    else
      flash[:error] = 'Cannot re-godown!'
    end
    redirect_to @object
  end
	private
		def godown_entry_params
			params.require(:godown_entry).permit(:from_warehouse_id, :godown_date, :info, :manufactory_id, :operator, :to_warehouse_id, :total_quantity)
		end
end
