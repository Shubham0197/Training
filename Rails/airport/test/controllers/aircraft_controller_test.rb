require "test_helper"

class AircraftControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get aircraft_index_url
    assert_response :success
  end

  test "should get show" do
    get aircraft_show_url
    assert_response :success
  end
end
