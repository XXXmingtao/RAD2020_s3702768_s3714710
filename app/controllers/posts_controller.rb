class PostsController < ApplicationController
  before_action :logged_in_user,only:[:new]

  def new
    @post=Post.new
    @topics = get_topics
  end

  def show
    @post=Post.find_by_id(params[:id])
    if @post.nil?
      render 'post_not_found'
    else
      @post.update_column(:view, @post.view+=1) unless request.original_url == request.referrer
      @user=User.find_by_id(@post.user_id)
      @active_users = Array.new
      Post.order('created_at DESC').each do |post|
        if User.find_by_id(post.user_id) != nil
          @active_users.push(User.find_by_id(post.user_id)) unless @active_users.include?(User.find_by_id(post.user_id))
        end
      end
      @comment=Comment.new
    end
  end

  def create
    @topics = get_topics
    @post=Post.new(post_params)
    @post.topic="News" if @post.topic==""
    @post.comment = @post.view = 0
    @post.user_id = current_user.id

    if @post.save
      flash[:success]="New post has been published!"
      redirect_to @post
    else
      render 'new'
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:success]="Post deleted"
    redirect_to "/my_posts"
  end

  private

    def logged_in_user
      unless logged_in?
        flash[:danger]= "Please log in."
        redirect_to login_url
      end
    end
  
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
