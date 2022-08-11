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

  scenario 'updating via valid inputs' do
    math = Exam.create!(name: 'Math')
    visit edit_exam_path(id: math.id)
    fill_in 'Name', with: 'Mathematics'
    click_on 'Update Exam'
    visit exams_path
    expect(page).to have_content('Mathematics')
  end

  scenario 'Deleting a exam' do
    math = Exam.create!(name: 'Math')
    visit exam_path(id: math.id)
    expect(page).to have_content('Math')
    
    click_on 'Destroy'
    expect(page).to have_content('Exam was successfully destroyed.')
    expect(page).not_to have_content('Math')
  end
end
