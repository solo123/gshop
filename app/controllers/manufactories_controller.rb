class ManufactoriesController < ResourcesController
	autocomplete :customer, :name
  def remove_customer
    m = Manufactory.find(params[:id])
    c = Customer.find(params[:customer])
    m.customers.delete(c)
    redirect_to :action => :show 
  end
  def add_customer
    m = Manufactory.find(params[:id])
    c = Customer.find(params[:customer])
    m.customers << c
    redirect_to :action => :show
  end
  def print
    load_object
    render 'print', :layout => 'print_layout'
  end
	private
		def manufactory_params
			params.require(:manufactory).permit(:address, :bank_account, :contact, :email, :name, :phone, :rating, :website, :biz_type, :factory_type)
    end
end
