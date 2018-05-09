class Password < ApplicationRecord
  # name, description, login, url: string
  # encrypted_password: string

  belongs_to :user

  attr_encrypted :password, key: (ENV['CI_SECRET'] || Rails.application.credentials.password_encryption_key).mb_chars.limit(32)

  validates :name, :login, :password, presence: true
end
