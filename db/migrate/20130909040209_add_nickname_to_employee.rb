class AddNicknameToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :nickname, :string
    add_column :employees, :roles, :string
  end
end
