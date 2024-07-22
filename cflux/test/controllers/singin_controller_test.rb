require "test_helper"

class SinginControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get singin_new_url
    assert_response :success
  end

  test "should get create" do
    get singin_create_url
    assert_response :success
  end
end
