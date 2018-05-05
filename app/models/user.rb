class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :two_factor_authenticatable,
         :rememberable, :trackable, :validatable,
         otp_secret_encryption_key: ENV['RAILS_OTP_SECRET_ENCRYPTION_KEY'] || Rails.application.credentials.totp_encryption_key

  after_create do |user|
    user.otp_required_for_login = true
    user.otp_secret = User.generate_otp_secret
    user.save
  end
end
