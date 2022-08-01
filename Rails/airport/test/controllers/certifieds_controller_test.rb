require "test_helper"

class CertifiedsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get certifieds_index_url
    assert_response :success
  end

  test "should get new" do
    get certifieds_new_url
    assert_response :success
  end

  test "should get edit" do
    get certifieds_edit_url
    assert_response :success
  end
end
