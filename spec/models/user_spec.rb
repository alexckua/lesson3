require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'assotiations' do
    it { is_expected.to have_many(:messages).dependent(:nullify) }
    it { is_expected.to have_many(:votes) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name).with_message('should be defined') }
    it { is_expected.to validate_presence_of(:email).with_message('should be defined') }
    it { is_expected.to validate_uniqueness_of(:email).with_message('should be unique!')}
  end
end
