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

  private 

    def count_popular_topics
      popular_topics = Hash.new
      Post.all.each do |post|
        if popular_topics.key?(post.topic)
          popular_topics[post.topic]+=post.view
        else
          popular_topics[post.topic] = post.view
        end
      end
      return popular_topics.sort_by {|k,v| v}.reverse.first 2
    end
end
