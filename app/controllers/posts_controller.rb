class PostsController < ApplicationController
  before_action :logged_in_user,only:[:new]

  def new
    @post=Post.new
    @topics = get_topics
  end

  def show
    @post=Post.find(params[:id])
    @post.update_column(:view, @post.view+=1)
    @active_users = Array.new
    Post.order('created_at DESC').each do |post|
      @active_users.push(User.find(post.author_id)) unless @active_users.include?(User.find(post.author_id))
    end
  end

  def create
    @topics = get_topics
    @post=Post.new(post_params)
    @post.topic="News" if @post.topic==""
    @post.comment = @post.view = 0
    @post.author_id = current_user.id

    if @post.save
      flash[:success]="New post has been published!"
      redirect_to @post
    else
      render 'new'
    end
  end

  def logged_in_user
    unless logged_in?
      flash[:danger]= "Please log in."
      redirect_to login_url
    end
  end

  private
  
    def post_params
      params.require(:post).permit(:title, :topic, :text)
    end

    def get_topics
      topics = Array.new
      Topic.all.each do |topic|
        topics.push(topic) unless topic.topic=="News"
      end
      return topics
    end

end
