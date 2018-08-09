class Note < ApplicationRecord
  # title: string
  # body: text

  belongs_to :user

  validates :title, presence: true
end
