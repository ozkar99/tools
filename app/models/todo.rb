class Todo < ApplicationRecord
  # desc, category: string
  
  belongs_to :user
  validates :desc, presence: true
end