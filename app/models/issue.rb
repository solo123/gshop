class Issue < ActiveRecord::Base
  belongs_to :employee
  belongs_to :manufactory
  has_many :notes, :as => :notes_data
  has_and_belongs_to_many :employees

  validates_presence_of :description

  scope :active_issues, -> { where(status: 1).reorder('due_date') } 
  default_scope { order('created_at DESC') }
end
