class EmployeesIssues < ActiveRecord::Migration
  def change
    create_table :employees_issues do |t|
      t.belongs_to :employee
      t.belongs_to :issue
    end
  end
end
