require 'test_helper'

class IndexControllerTest < ActionDispatch::IntegrationTest
  test "should get signup" do
    get index_signup_url
    assert_response :success
  end

end
