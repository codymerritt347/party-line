require "test_helper"

class FreelanceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get freelance_index_url
    assert_response :success
  end
end
