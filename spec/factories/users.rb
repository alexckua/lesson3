FactoryBot.define do
  factory :user do
    name 'Hron'
    password 'password'
    sequence(:email) { |n| "hron#{n}@email.com" }
  end
end
