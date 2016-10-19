class AddBuzTypeToManufactory < ActiveRecord::Migration
  def change
    add_column :manufactories, :biz_type, :string
    add_column :manufactories, :factory_type, :string
  end
end
