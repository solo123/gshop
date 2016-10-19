class EmployeesController < ResourcesController
  before_action :check_is_admin, only: [:index, :show, :edit, :update, :destroy]

  def update_password
    @object = Employee.find(current_employee.id)
    if @object.update_attributes(employee_params)
      # Sign in the user by passing validation in case his password changed
      sign_in @object, :bypass => true
      redirect_to root_path
    else
      flash[:error] = @object.errors
      redirect_to myaccount_employees_path
    end
  end

  private
    def check_is_admin
      unless current_employee.roles && current_employee.roles.index('admin')
        redirect_to root_path
      end
    end

    def employee_params
      params.required(:employee).permit(:password, :password_confirmation, :nickname)
    end
  
end

