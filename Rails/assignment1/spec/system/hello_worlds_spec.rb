require 'rails_helper'

RSpec.describe "HelloWorlds", type: :system do
  describe 'index page' do
    it 'shows the right content' do
      visit hello_world_index_path
      #can add sleep to see what the spec do to test page
      sleep(5)
      expect(page).to have_content('Hello, world!')
    end
  end
end
