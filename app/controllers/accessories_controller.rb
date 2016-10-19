class AccessoriesController < ResourcesController
  def select
    load_collection
  end
  def search
    render 'search', :layout => nil
  end
	private
		def accessory_params
			params.require(:accessory).permit(:short_code, :brand, :catalog, :info, :name, :price, :product_id)
		end
end
