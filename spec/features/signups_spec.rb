require 'rails_helper'

RSpec.feature 'Sign Up', type: :feature, js: true do

  let(:hron) { create(:hron) }

  before do
    visit root_path
  end

  it 'creates new user' do
    within '#new_session' do
      fill_in 'Email', with: 'person@mail.com'
      fill_in 'Name', with: 'Hron'
      fill_in 'Password', with: 'password'
    end
    click_button 'Submit'
    expect(page).to have_content('Cool')
  end

  it 'does not create new user' do
    within '#new_session' do
      fill_in 'Email', with: 'person@mail.com'
      fill_in 'Name', with: 'Hron'
      fill_in 'Password', with: ''
    end
    click_button 'Submit'
    expect(page).not_to have_content('Cool')
  end

  it 'logins existing user' do
    within '#new_session' do
      fill_in 'Email', with: hron.email
      fill_in 'Password', with: hron.password
    end
    click_button 'Submit'
    expect(page).to have_content('Cool')
  end

  it 'updates user\'s name on login' do
    within '#new_session' do
      fill_in 'Email', with: hron.email
      fill_in 'Name', with: 'Ya ne Hron'
      fill_in 'Password', with: hron.password
    end
    click_button 'Submit'
    expect(page).to have_content('Ya ne Hron')
  end
end
