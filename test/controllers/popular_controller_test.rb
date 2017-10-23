require 'test_helper'

class PopularControllerTest < ActionDispatch::IntegrationTest
  test "should get Products" do
    get popular_Products_url
    assert_response :success
  end

end
