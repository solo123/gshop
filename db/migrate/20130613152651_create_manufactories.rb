class CreateManufactories < ActiveRecord::Migration
  def change
    create_table :manufactories do |t|
      t.string :name
      t.string :address
      t.string :website
      t.string :phone
      t.string :email
      t.string :bank_account
      t.string :contact
      t.decimal :rating

      t.timestamps
    end
  end
end
