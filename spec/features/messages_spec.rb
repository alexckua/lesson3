require 'rails_helper'

RSpec.feature 'Message', type: :feature, js: true do

  let!(:user) { create(:user, online: true) }
  let(:text) { 'Message text' }
  let!(:message) { create(:message, text: 'New message', user_id: user.id) }

  before do
    visit root_path
    fill_in 'Email', with: user.email
    fill_in 'Name', with: user.name
    fill_in 'Password', with: user.password
    click_button 'Submit'
  end

  it 'create new message' do
    fill_in 'message_text', with: text
    click_button 'Send'

    expect(page).to have_content('Message text')
  end

  it 'edit message ' do
    click_button 'edit'
    fill_in 'edit_message_text', with: 'Update message'
    click_button 'Update'

    expect(page).to have_content('Update message')
  end

  it 'delete message' do
    accept_confirm { click_button 'delete' }

    expect(page).to have_no_content('New message')
  end
end
