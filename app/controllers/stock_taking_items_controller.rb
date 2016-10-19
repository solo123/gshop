class StockTakingItemsController < NestedResourcesController
	private
		def stock_taking_item_params
			params.require(:stock_taking_item).permit(:product_data_id, :product_data_type, :quantity, :status, :stock_taking_id, :full_name, :catalog, :product_id)
    end
end
