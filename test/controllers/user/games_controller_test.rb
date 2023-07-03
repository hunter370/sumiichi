require "test_helper"

class User::GamesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_games_index_url
    assert_response :success
  end

  test "should get show" do
    get user_games_show_url
    assert_response :success
  end
end
