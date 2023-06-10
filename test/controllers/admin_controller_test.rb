require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get tournament_teams" do
    get admin_tournament_teams_url
    assert_response :success
  end
end
