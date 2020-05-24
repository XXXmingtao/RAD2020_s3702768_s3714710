class CommentsController < ApplicationController
  before_action :logged_in_user,only:[:create]
  before_action :correct_user, only: :destroy

  def create
    @comment=Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = params[:id]
    @comment.comment_id = params[:comment]? params[:reply] : nil  
    if @comment.save
      flash[:success]="New comment has been published!"
      post = Post.find(params[:id])
      post.update_column(:comment, post.comment+=1)
    elsif @comment.content==""
      flash[:fail]="Comment can't be blank"
    else
      flash[:fail]="Comment is too long (maximum is 200 characters)"
    end
    redirect_to request.referrer
  end

  def destroy
    post = Post.find_by_id(Comment.find(params[:id]).post_id)
    post.update_column(:comment, post.comment-=1) unless post.nil?
    Comment.find(params[:id]).destroy
    flash[:success]="Comment deleted"
    redirect_to "/my_comments"
  end

  private

  def logged_in_user
    unless logged_in?
      flash[:danger]= "Please log in."
      redirect_to login_url
    end
  end

  def correct_user
    redirect_to(root_url) unless current_user.id==Comment.find(params[:id]).user_id
  end

  def comment_params
    params.require(:comment).permit(:root,:content)
  end

end
