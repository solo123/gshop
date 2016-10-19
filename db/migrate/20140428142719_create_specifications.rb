class CreateSpecifications < ActiveRecord::Migration
  def change
    create_table :specifications do |t|
      t.integer :show_order
      t.string :spec_title
      t.integer :status

      t.timestamps
    end
  end
end
