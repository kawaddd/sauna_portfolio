require "test_helper"

class Public::Users::HozonSaunasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_users_hozon_saunas_index_url
    assert_response :success
  end
end
