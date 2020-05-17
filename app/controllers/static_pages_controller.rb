class StaticPagesController < ApplicationController
  def home
    @posts=Post.order('created_at DESC')
    @users = User.all
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
