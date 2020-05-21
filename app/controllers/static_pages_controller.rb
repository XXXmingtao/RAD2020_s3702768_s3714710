class StaticPagesController < ApplicationController
  def home
    @posts=Post.order('created_at DESC')
    @active_users = Array.new
    @posts.each do |post|
      user = User.find_by_id(post.user_id)
      if user != nil
        @active_users.push(user) unless @active_users.include?(user)
      end
    end
  end

  def search
    if @posts=Post.search(params[:search])
      render 'result'
    else
      render 'search'
    end
  end
end
