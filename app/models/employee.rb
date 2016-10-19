class Employee < ActiveRecord::Base
  has_and_belongs_to_many :issues
	belongs_to :default_shop, class_name: 'Warehouse'

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

end
