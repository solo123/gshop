class SalesSheetItemsController < NestedResourcesController
    def destroy
      load_object
      @object.destroy
      redirect_to @parent
    end
	private
		def sales_sheet_item_params
			params.require(:sales_sheet_item).permit(:serial_product_id, :serial_number, :amount, :price, :product_data_id, :product_data_type, :quantity, :sales_sheet_id, :description, :product_id)
    end

end
