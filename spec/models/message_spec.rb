require 'rails_helper'

RSpec.describe Message, type: :model do

  let(:hron){ create(:user) }
  let!(:message) { create(:message) }


  describe '#vote' do
    context 'likes' do
      it { expect { message.vote('like', hron) }.to change { message.likes_count }.from(0).to(1) }
    end

    context 'unlikes' do
      let!(:vote) { message.vote('like', hron) }
      it { expect { message.vote('like', hron) }.to change { message.likes_count }.from(1).to(0) }
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:likes) }
    it { is_expected.to have_many(:dislikes) }
    it { is_expected.to have_many(:votes).dependent(:delete_all) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:text) }
  end

  describe 'delegations' do
    it { should delegate_method(:name).to(:user).with_prefix(true) }
  end
end
