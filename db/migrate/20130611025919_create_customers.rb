class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :title
      t.string :mobile
      t.string :phone
      t.string :email
      t.string :qq
      t.string :address
      t.integer :level, :default => 0
      t.string :info
      t.string :reason

      t.timestamps
    end
  end
end
