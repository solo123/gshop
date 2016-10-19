class WarehousesController < ResourcesController
	def correct
		Stock.select('warehouse_id, product_id, count() as cnt').group('warehouse_id, product_id').having('cnt>1').each do |st|
			next unless st.warehouse_id && st.product_id
      first_st = Stock.where(warehouse_id: st.warehouse_id).where(product_id: st.product_id).first
			while (last_st = Stock.where(warehouse_id: st.warehouse_id).where(product_id: st.product_id).last).id != first_st.id do
        first_st.on_hand += last_st.on_hand
				first_st.stock_journals << last_st.stock_journals
				last_st.product_id = nil
				last_st.on_hand = 0
				last_st.save!
		  end
			first_st.save!
		end
	end
	private
		def warehouse_params
			params.require(:warehouse).permit(:name, :pre_code, :status)
    end
end
