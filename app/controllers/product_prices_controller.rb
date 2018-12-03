class ProductPricesController < NestedResourcesController
  def catalog
    redirect_to :action => :index
  end
  def calculate
    GodownItem.where(status: 1).each do |item|
      pr = item.product.product_price
      if pr
        if item.quantity > 0 && item.cost > 0
          pr.godown_count += item.quantity
          pr.godown_amount += item.cost
          pr.godown_price = (pr.godown_amount + pr.godown_fee) / pr.godown_count if pr.godown_count > 0
          pr.save
        end
        item.status = 2
        item.save
      end
    end
    redirect_to :action => :index
  end
  def load_collection
    @q = Product.search(params[:q])
    @collection = @q.result(distinct: true).page(params[:page])
  end 
  private
  def product_price_params
    params.require(:product_price).permit(:godown_amount, :godown_count, :godown_fee, :godown_price, :price, :product_id, :status)
  end

end
