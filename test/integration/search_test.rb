require 'test_helper'

class SearchTest < ActionDispatch::IntegrationTest

    def setup
        log_in_as(users(:michael))
        post posts_path, params: {post: {title:"Search Test",topic:"",text:"This is a test post"} }
    end

    test "empty search should lead to a search page" do
        get '/search',params: {search: ""}
        assert_template 'static_pages/search'
    end

    test "invalid search" do
        input = "invalid"
        get '/search',params: {search: input}
        assert_template 'static_pages/result'
        assert_select 'p', "We couldn't find any results for #{input}"
    end
    
    test "valid search" do
        input = "Test"
        get '/search',params: {search: input}
        assert_template 'static_pages/result'
        assert_select 'p', "Results for #{input}"
    end

    test "search should be non-case sensitive" do
        input = "TeSt"
        get '/search',params: {search: input}
        assert_template 'static_pages/result'
        assert_select 'p', "Results for #{input}"
    end
    
end