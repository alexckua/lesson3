FactoryBot.define do
  factory :message do
    text 'Message text'
    user_id { create(:user).id }
  end
end
