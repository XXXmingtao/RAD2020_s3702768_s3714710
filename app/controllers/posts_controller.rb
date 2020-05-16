class PostsController < ApplicationController
  before_action :logged_in_user,only:[:new]

  def new
    @user=User.new
  end

  def show
    @post=Post.find(params[:id])
  end

  def logged_in_user
    unless logged_in?
      flash[:danger]= "Please log in."
      redirect_to login_url
    end
  end
end
