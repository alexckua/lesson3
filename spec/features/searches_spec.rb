require 'rails_helper'

RSpec.feature "Searches", type: :feature do

  let(:user) { User.create(email: 'hron@mail.com', password: '1', name: 'Hron') }
  let!(:message) { Message.create(user: user, text: 'testing') }

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  it 'finds right messages' do
    visit chat_path
    find('#q').set 'test'
    find('.btn-search').click
    expect(page).to have_content(message.text)
  end
end
