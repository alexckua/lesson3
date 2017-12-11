require 'rails_helper'

RSpec.describe Message, type: :model do

  let(:hron) { User.create(email: 'hron@gmail.com', password: 'password', name: 'Hron') }
  let!(:message) { Message.create(text: 'text', user: hron) }

  describe '#vote' do
    it 'likes' do
      expect { message.vote('like', hron) }.to change { message.likes_count }.from(0).to(1)
    end

    it 'unlikes' do
      message.vote('like', hron)
      expect { message.vote('like', hron) }.to change { message.likes_count }.from(1).to(0)
    end
  end
end
