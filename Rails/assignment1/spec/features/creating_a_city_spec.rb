require 'rails_helper'

RSpec.feature "CreatingACities", type: :feature do
  scenario 'valid inputs' do
    visit new_city_path
    fill_in 'Name', with: 'Minneapolis'
    click_on 'Create City'
    visit cities_path
    expect(page).to have_content('Minneapolis')
  end
end
