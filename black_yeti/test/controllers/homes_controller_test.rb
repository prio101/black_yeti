require "test_helper"

class HomesControllerTest < ActionDispatch::IntegrationTest
  test "should return 200" do
    get :index
    assert_response 200
  end
end
