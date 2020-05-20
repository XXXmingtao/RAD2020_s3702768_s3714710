class CommentsController < ApplicationController
  before_action :logged_in_user,only:[:create]

  def create
    @comment=Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = params[:token]
    if @comment.save
      flash[:success]="New comment has been published!"
      post = Post.find(params[:token])
      post.update_column(:comment, post.comment+=1)
    elsif @comment.content==""
      flash[:fail]="Comment can't be blank"
    else
      flash[:fail]="Comment is too long (maximum is 200 characters)"
    end
    redirect_to request.referrer
  end

  private

  def logged_in_user
    unless logged_in?
      flash[:danger]= "Please log in."
      redirect_to login_url
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end
