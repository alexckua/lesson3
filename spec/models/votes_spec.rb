require 'rails_helper'

RSpec.describe Vote, type: :model do

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:message) }
  end

  describe 'validations' do
    it { is_expected.to validate_uniqueness_of(:user_id) }
  end
end
