FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password { FFaker::Internet.password }

    after(:build) do |u|
      u.password_confirmation = u.password
    end
  end
end
