require "test_helper"

class Public::Users::ReviewedSaunasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_users_reviewed_saunas_index_url
    assert_response :success
  end
end
