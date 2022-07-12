class UserAddress < ApplicationRecord
  belongs_to :user

  validates :street, :number, :city, :state, presence: true
end
