class ProductsController < NestedResourcesController
  def select
    load_collection
  end
  def search
    render 'search', :layout => nil
  end
  def merge
    load_object
    target_product = Product.find(params[:merge_to])
    SalesSheetItem.where(product_id: @object.id).update_all(product_id: target_product.id)
    Stock.where(product_id: @object.id).update_all(product_id: target_product.id)
    StockJournal.where(product_id: @object.id).update_all(product_id: target_product.id)
    StockTakingItem.where(product_id: @object.id).update_all(product_id: target_product.id)
    GodownItem.where(product_id: @object.id).update_all(product_id: target_product.id)
    @object.delete
    redirect_to target_product
  end
  def concat
    Product.all.each do |p|
      p.full_name = p.catalog.split('/').last + '| ' + p.full_name.split('| ').last
      p.save
    end
    redirect_to action: :index
  end
	private
		def product_params
			params.require(:product).permit(:brand, :catalog, :full_name, :godown_amount, :godown_count, :godown_fee, :godown_price, :model, :price, :status)
		end
end
