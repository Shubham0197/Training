require 'rails_helper'

RSpec.feature "CreatingACities", type: :feature do
  it 'shows the right content' do
    visit new_city_path
    sleep(5)
    click_on 'Create City'
    visit cities_path
    expect(page).to have_content('Minneapolis')
  end
end
