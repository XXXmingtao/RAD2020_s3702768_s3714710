require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
    def setup
        @post = posts(:one)
        @user = users(:michael)
    end

    test "should redirect new when not logged in" do
        get newpost_path
        assert_not flash.empty?
        assert_redirected_to login_url
    end

    test "should get new when logged in" do
        log_in_as(@user)
        get newpost_path
        assert_response :success
    end

end
