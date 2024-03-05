require "test_helper"

class SpendsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get spends_index_url
    assert_response :success
  end
end
