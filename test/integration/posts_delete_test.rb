require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
    @another_user = users(:archer)
    @post = posts(:one)
    @path = "/posts/#{@post.id}"
  end

  test "posts owner delete the posts" do
    log_in_as(@user)
    get '/my_posts'
    assert_template 'users/my_posts'
    assert_select 'a', text:@post.title
    assert_select 'a', text:'Delete'
    assert_difference 'Post.count', -1 do
      delete @path
    end
  end

  test "users should not be able to delete others'posts" do
    log_in_as(@another_user)
    get '/my_posts'
    assert_template 'users/my_posts'
    assert_select 'a', text:@post.title, count:0
    assert_no_difference 'Post.count' do
      delete @path
    end
  end

end
