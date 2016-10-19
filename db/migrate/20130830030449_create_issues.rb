class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :title
      t.string :description
      t.datetime :due_date
      t.integer :employee_id
      t.integer :status, :default => 0

      t.timestamps
    end
  end
end
