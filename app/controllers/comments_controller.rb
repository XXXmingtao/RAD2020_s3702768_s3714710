class CommentsController < ApplicationController
  def new
    @comment=Comment.new
  end

  def create
    @comment=Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = params[:token]
    if @comment.save
      flash[:success]="New comment has been published!"
    elsif @comment.content==""
      flash[:fail]="Comment can't be blank"
    else
      flash[:fail]="Comment is too long (maximum is 200 characters)"
    end
    redirect_to request.referrer
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
