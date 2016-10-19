class GuitarsController < ResourcesController

  def show
    load_object
    if @parent
      @parent.product_data = @object
      @parent.product_name = "#{@object.brand} #{@object.model}"
      #@parent.product_model = @object.guitar_type
      @parent.save!
      redirect_to @parent
      return
    end
  end
  def new
    load_parent
    @object = Guitar.new
  end
  def create
    load_parent
    @object = Guitar.new(params[:guitar])
    if @object.save
      if @parent
        @parent.product_data = @object
        @parent.save
        redirect_to @parent
        return
      end
    else
      flash[:error] = @object.errors.full_messages.to_sentence
      @no_log = 1
    end
  end

  def load_collection
    load_parent
    params[:search] ||= {}
    @search = Guitar.metasearch(params[:search])
    pages = 20
    @collection = @search.paginate(:page => params[:page], :per_page => pages)
  end 
  def load_object
    load_parent
    @object = Guitar.find_by_id(params[:id])
  end
  def load_parent
    @parent = SerialProduct.find(params[:serial_product_id]) if params[:serial_product_id]
  end
	private
		def guitar_params
			params.require(:guitar).permit(:short_code, :info, :model, :guitar_type, :brand, :price, :title_photo_id, :photos, :product_id)
    end
end
