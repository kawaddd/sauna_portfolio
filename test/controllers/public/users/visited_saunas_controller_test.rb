require "test_helper"

class Public::Users::VisitedSaunasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_users_visited_saunas_index_url
    assert_response :success
  end
end
