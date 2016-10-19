class AddRelatedCompanyToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :manufactory_id, :integer
  end
end
