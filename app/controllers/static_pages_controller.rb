class StaticPagesController < ApplicationController
  def home
    @tests = Post.all
    @topics = Topic.all
    @posts = Post.order('created_at DESC')
    @users = User.all
    @toolbar_posts = Post.order('view DESC').limit(5)
    @active_users = Array.new
    @posts.each do |post|
      @active_users.push(User.find(post.author_id)) unless @active_users.include?(User.find(post.author_id))
      end
  end

  def help
  end

  def about
  end

  def contact
  end
end
