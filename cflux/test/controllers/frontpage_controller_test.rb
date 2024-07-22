require "test_helper"

class FrontpageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get frontpage_index_url
    assert_response :success
  end
end
