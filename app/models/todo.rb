class Todo < ApplicationRecord
  belongs_to :user

  validates :title, :description, :date, presence: true
end
