require "application_system_test_case"

class CustomrsTest < ApplicationSystemTestCase
  setup do
    @customr = customrs(:one)
  end

  test "visiting the index" do
    visit customrs_url
    assert_selector "h1", text: "Customrs"
  end

  test "should create customr" do
    visit customrs_url
    click_on "New customr"

    fill_in "Dob", with: @customr.DOB
    fill_in "Email address", with: @customr.email_address
    fill_in "Mobile number", with: @customr.mobile_number
    fill_in "Name", with: @customr.name
    click_on "Create Customr"

    assert_text "Customr was successfully created"
    click_on "Back"
  end

  test "should update Customr" do
    visit customr_url(@customr)
    click_on "Edit this customr", match: :first

    fill_in "Dob", with: @customr.DOB
    fill_in "Email address", with: @customr.email_address
    fill_in "Mobile number", with: @customr.mobile_number
    fill_in "Name", with: @customr.name
    click_on "Update Customr"

    assert_text "Customr was successfully updated"
    click_on "Back"
  end

  test "should destroy Customr" do
    visit customr_url(@customr)
    click_on "Destroy this customr", match: :first

    assert_text "Customr was successfully destroyed"
  end
end
