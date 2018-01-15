FactoryBot.define do

  factory :user do
    name 'User'
    password 'password'
    sequence(:email) { |n| "user#{n}@email.com" }
  end

  factory :hron, class: 'User' do
    name 'Hron'
    password 'password'
    email 'person@mail.com'
  end

  factory :message do
    text 'Message text'
    user_id { create(:user).id }
  end
end
