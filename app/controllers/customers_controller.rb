class CustomersController < NestedResourcesController
  def select
    load_object
    if @parent
      @parent.customer = @object
      @parent.save
      redirect_to @parent
      return
    end
    render :text => 'no parent'
  end
  def new
    super
    @object.mobile = params[:q] if params[:q]
  end

	private
		def customer_params
			params.require(:customer).permit(:address, :email, :info, :level, :mobile, :name, :phone, :qq, :reason, :title)
		end
end
