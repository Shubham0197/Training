require "test_helper"

class CustomrsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customr = customrs(:one)
  end

  test "should get index" do
    get customrs_url
    assert_response :success
  end

  test "should get new" do
    get new_customr_url
    assert_response :success
  end

  test "should create customr" do
    assert_difference("Customr.count") do
      post customrs_url, params: { customr: { DOB: @customr.DOB, email_address: @customr.email_address, mobile_number: @customr.mobile_number, name: @customr.name } }
    end

    assert_redirected_to customr_url(Customr.last)
  end

  test "should show customr" do
    get customr_url(@customr)
    assert_response :success
  end

  test "should get edit" do
    get edit_customr_url(@customr)
    assert_response :success
  end

  test "should update customr" do
    patch customr_url(@customr), params: { customr: { DOB: @customr.DOB, email_address: @customr.email_address, mobile_number: @customr.mobile_number, name: @customr.name } }
    assert_redirected_to customr_url(@customr)
  end

  test "should destroy customr" do
    assert_difference("Customr.count", -1) do
      delete customr_url(@customr)
    end

    assert_redirected_to customrs_url
  end
end
