class IssuesController < ResourcesController
  autocomplete :manufactory, :name, :full => true

  def create
    params.permit!
    @object = Issue.new(params[:issue])
    @object.employee = current_employee
    @object.due_date = Date.today unless @object.due_date
    @object.status = 1
    if @object.save
      if params[:emp]
        params[:emp].each do |para|
          @object.employees << Employee.find(para[0])
        end
      end
      @object.employees << current_employee
      @object.save
      respond_to do |format|
        format.html { redirect_to @object }
        format.js
      end
      return
    else
      flash[:error] = @object.errors.full_messages.to_sentence
    end
    respond_to do |format|
      format.html { redirect_to :action => :new }
    end
  end
  def update
    if params[:emp]
		  load_object
      @object.employees.clear
      params[:emp].each do |para|
        @object.employees << Employee.find(para[0])
      end
    end
    super
  end

  private
  def issue_params
    params.require(:issue).permit(:title, :description, :due_date, :employee_id, :status)
  end
end
