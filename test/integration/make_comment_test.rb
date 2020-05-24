require 'test_helper'

class MakeCommentTest < ActionDispatch::IntegrationTest

    def setup
        log_in_as(users(:michael))
        @path = "/posts/#{posts(:one).id}"
    end
    
    test "empty comment" do
        assert_no_difference 'Comment.count' do
            post (@path+"/comment"), params: {comment: {content:""} }, headers: { "HTTP_REFERER" => @path }
        end
    end

    test "invalid long comment" do
        assert_no_difference 'Comment.count' do
            post (@path+"/comment"), params: {comment: {content:("a"*300)} }, headers: { "HTTP_REFERER" => @path }
        end
    end

    test "make valid comment should increase the comment number of the post" do
        assert_difference 'Comment.count',1 do
            post (@path+"/comment"), params: {comment: {content:"This is a test comment"} }, headers: { "HTTP_REFERER" => @path }
        end
        follow_redirect!
        assert_select 'div.card-info-comment', "1"
    end

    
end