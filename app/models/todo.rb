class Todo < ApplicationRecord
  # desc, category: string

  belongs_to :user
  validates :description, presence: true
end
