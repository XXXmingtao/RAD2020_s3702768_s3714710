class StaticPagesController < ApplicationController
  def home
    @tests = Post.all
    @topics = Topic.all
    @posts = Post.order('created_at DESC')
    @users = User.all
    @toolbar_posts = Post.order('view DESC').limit(5)
  end

  def help
  end

  def about
  end

  def contact
  end
end
