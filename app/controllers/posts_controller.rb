class PostsController < ApplicationController
  before_action :logged_in_user,only:[:new]

  def new
    @post=Post.new
    @topics=Topic.all
  end

  def show
    @post=Post.find(params[:id])
  end

  def create
    @post=Post.new(post_params)
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
      params.require(:post).permit(:title, :author_id, :topic, :text)
    end
end
