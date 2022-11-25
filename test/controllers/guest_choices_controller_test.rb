require "test_helper"

class GuestChoicesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get guest_choices_index_url
    assert_response :success
  end
end
