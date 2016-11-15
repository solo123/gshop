class CatalogsController < ApplicationController
  def show
    @catalog = Product.select('catalog, count(*) as cnt').order(:catalog).group(:catalog)
    if params[:cat]
      @collection = Product.show_order.where(catalog: params[:cat])
    end
  end

end
