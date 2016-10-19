class GodownItemsController < NestedResourcesController
    def destroy
      load_object
      @object.destroy
      redirect_to @parent
    end
	private
		def godown_item_params
			params.require(:godown_item).permit(:cost, :godown_entry_id, :product_data_id, :product_data_type, :quantity, :status, :product_id)
		end
end
