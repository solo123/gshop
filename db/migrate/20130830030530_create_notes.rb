class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :notes_data_type
      t.integer :notes_data_id
      t.string :notes_text
      t.integer :employee_id
      t.integer :status, :default => 0

      t.timestamps
    end
  end
end
