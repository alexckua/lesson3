require 'rails_helper'

RSpec.feature 'Sign Out', type: :feature, js: true do

  let(:hron) { create(:hron) }

  before do
    visit root_path
    within '#new_session' do
      fill_in 'Email', with: 'person@mail.com'
      fill_in 'Name', with: 'Hron'
      fill_in 'Password', with: 'password'
    end
    click_button 'Submit'
  end

  it 'logout existing user' do
    click_link 'toggle-menu'
    click_link 'logout'

    expect(page).to have_content('You\'re logged out')
  end
end
