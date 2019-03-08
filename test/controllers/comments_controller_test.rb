require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get edity" do
    get comments_edity_url
    assert_response :success
  end

end
