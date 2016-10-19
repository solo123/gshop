class Note < ActiveRecord::Base
  belongs_to :notes_data, :polymorphic => true
  belongs_to :employee
end
