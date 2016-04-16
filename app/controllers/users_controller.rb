class UsersController < ApplicationController
  def feed
    @post=Post.new
@user= User.find_by id: params[:id]
@current_user = User.find_by id: session[:user_id]
if @current_user && @current_user.following_users.present?
    follower_ids = @current_user.following_users.pluck(:id)
    all_ids = follower_ids << @current_user.id
    @posts = Post.where(user_id: all_ids).order("created_at DESC")
  else
    @posts = Post.all.order("created_at desc")
  end
  end

  def new_post
@post=Post.new
end

def create_post
  @post = Post.new params.require(:post).permit(:text,:user_id, :view_count, :culture, :type, :location, :photo)
  @post.user=@current_user
  if @post.save
    redirect_to posts_path(id: @current_user.id)
  else
    flash.now[:alert] = "Looks like your Missing Something"
    render :new
  end
end

  def profile
  end

  def new
  end

  def explore
  end

  def new
  @user=User.new
  end

  def create
  @user = User.new params.require(:user).permit(:email, :password, :first_name, :last_name, :user_name, :city)
  if @user.save
   session[:user_id] = @user.id
  redirect_to posts_path(id: @user.id)
  else
   flash.now[:alert] = "Something is Missing"
  render:new
  end
  end

  end
