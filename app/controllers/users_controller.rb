class UsersController < ApplicationController
  before_action :logged_in_user,only:[:index,:edit,:update, :destroy]
  before_action :correct_user, only: [:edit,:update]
  before_action :admin_user, only: :destroy

  def index
    @users=User.paginate(page: params[:page])
  end

  def show
    @user=User.find_by_id(params[:id])
    if @user.nil?
      render 'user_not_found' 
    else
      @posts = Post.where(user_id:@user.id)
      @comments = Comment.where(user_id:@user.id)
    end
  end
    
  def new
    @user=User.new
  end

  def create
    @user=User.new(user_params)
    if @user.save
      log_in @user
      flash[:success]="Welcome to the News+!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success]="Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success]="User deleted"
    redirect_to users_url
  end

  def my_posts
    @posts = Post.where(user_id:current_user.id)
    render "/users/my_posts"
  end

  def my_comments
    @comments = Comment.where(user_id:current_user.id)
    render "/users/my_comments"
  end

  def verify
    @user = User.find(params[:id])
    verification = verify_params
    if verification["student_name"] == "" || verification["card_num"] == "" || verification["verifycard"].nil?
      flash[:fail]="All fields are required for verification!"
      redirect_to request.referrer
    else
      if @user.update_attributes(verify_params)
        flash[:success]="Verification updated"
        redirect_to @user
      else
        render 'edit'
      end
    end
    
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :email, :phone, :address, :userbio, :avatar, :studentname, :studentid, :verifycard)
    end

    def verify_params
      params.require(:user).permit(:student_name, :card_num, :verifycard)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger]="Please log in."
        redirect_to login_url
      end
    end

    def correct_user
      @user=User.find_by_id(params[:id])
      if @user.nil?
        render 'user_not_found'
      else
        redirect_to(root_url) unless current_user?(@user)
      end
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end