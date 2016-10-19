class DelIssuesTitle < ActiveRecord::Migration
  def change
    remove_column :issues, :title
  end
end
