require 'rails_helper'

RSpec.feature "CreatingAExams", type: :feature do
  scenario 'valid inputs' do
    visit new_exam_path
    fill_in 'Name', with: 'Maths'
    click_on 'Create Exam'
    visit exams_path
    expect(page).to have_content('Maths')
  end

  scenario 'invalid inputs' do
    visit new_exam_path
    fill_in 'Name', with: ''
    click_on 'Create Exam'
    expect(page).to have_content("Name can't be blank")
  end
end
