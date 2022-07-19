class User < ApplicationRecord
  has_secure_password
  
  validates :name, :email, presence: true
  validates_uniqueness_of :email
  has_one :user_address
  has_many :todos
end
