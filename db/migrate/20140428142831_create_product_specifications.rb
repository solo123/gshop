class CreateProductSpecifications < ActiveRecord::Migration
  def change
    create_table :product_specifications do |t|
      t.integer :product_id
      t.integer :specification_id
      t.string :spec_text

      t.timestamps
    end
  end
end
