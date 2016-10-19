class StocksController < NestedResourcesController
  def load_collection
    load_parent
    @collection = @parent.stocks.where('on_hand != 0').select('stocks.*, products.full_name, products.catalog').joins(:product).order('catalog, full_name')
  end
	private
		def stock_params
			params.require(:stock).permit(:info, :last_buy_date, :on_hand, :product_data_id, :product_data_type, :sold_out_date, :title_photo_id, :product_id)
    end
end
