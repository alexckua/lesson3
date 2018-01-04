FactoryBot.define do
  factory :message do
    text 'text'
    user_id { create(:user).id }
  end
end
