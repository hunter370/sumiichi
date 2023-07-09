require "test_helper"

class User::TournamentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_tournaments_index_url
    assert_response :success
  end

  test "should get show" do
    get user_tournaments_show_url
    assert_response :success
  end
end
