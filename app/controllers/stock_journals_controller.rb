class StockJournalsController < NestedResourcesController
	private
		def stock_journal_params
			params.require(:stock_journal).permit(:stock_after, :stock_before, :stock_change, :stock_id, :product_id)
    end
end
