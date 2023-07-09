require "test_helper"

class User::SupportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_supports_index_url
    assert_response :success
  end
end
