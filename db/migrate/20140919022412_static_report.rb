class StaticReport < ActiveRecord::Migration
  def change
    create_table :static_reports do |t|
      t.integer :report_num
      t.integer :row
      t.integer :col
      t.string :val
      t.integer :report_type, default: 0
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
