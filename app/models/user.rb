class User < ApplicationRecord
  devise :two_factor_authenticatable,
         :rememberable, :trackable, :validatable,
         otp_secret_encryption_key: ENV['CI_SECRET'] || Rails.application.credentials.totp_encryption_key

  has_many :password_items

  after_create do |user|
    user.otp_required_for_login = true
    user.otp_secret = User.generate_otp_secret
    user.save
  end
end
