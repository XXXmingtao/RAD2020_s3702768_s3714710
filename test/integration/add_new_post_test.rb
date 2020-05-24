require 'test_helper'

class AddNewPostTest < ActionDispatch::IntegrationTest

    def setup
        @user = users(:michael)
    end
    
    test "invalid post" do
        log_in_as(@user)
        get newpost_path
        assert_no_difference 'Post.count' do
            post posts_path, params: {post: {title:"",
                topic:"",
                text:""} }
        end
        assert_template 'posts/new'
    end

    test "valid post" do
        log_in_as(@user)
        get newpost_path
        assert_difference 'Post.count', 1 do
            post posts_path, params: {post: {title:"Test",
                topic:"Game",
                text:"This is a test post"} }
        end
        follow_redirect!
        assert_template 'posts/show'
    end

    test "valid post with empty topic should be assigned a default topic" do
        log_in_as(@user)
        get newpost_path
        assert_difference 'Post.count', 1 do
            post posts_path, params: {post: {title:"Test",
                topic:"",
                text:"This is a test post"} }
        end
        follow_redirect!
        assert_template 'posts/show'
        assert_select 'div.post-topic', "News"
    end

    test "The number of views of a post increases by 1 when a viewer opens the post page." do
        log_in_as(@user)
        post posts_path, params: {post: {title:"Test",
            topic:"",
            text:"This is a test post"} }
        follow_redirect!
        assert_select 'div.card-info-view', "1"
        @path = path
        get root_path
        get @path
        assert_select 'div.card-info-view', "2"
    end
end