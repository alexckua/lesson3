require 'rails_helper'

RSpec.feature 'Locales', type: :feature, js: true do

  context 'user manually' do
    before do
      visit root_path
    end

    it 'set locale ua' do
      click_link 'UA'

      expect(page).to have_content('Увійти')
    end

    it 'set locale en' do
      click_link 'EN'

      expect(page).to have_content('Login In')
    end
  end


  context 'when user default locale ua' do
    before do
      I18n.default_locale = :ua
      visit root_path
    end

    it 'set locale ua' do
      expect(I18n.locale).to eq :ua
      expect(page).to have_content('Увійти')
    end
  end

  context 'when user default locale en' do
    before do
      I18n.default_locale = :en
      visit root_path
    end

    it 'set locale en' do
      expect(I18n.locale).to eq :en
      expect(page).to have_content('Login In')
    end
  end
end
