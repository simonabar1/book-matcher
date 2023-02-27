class UsersController < ApplicationController

  def index
    @users = User.all
    @most_followed = User.all.sort_by { |user| -user.followers.count }.take(3)

  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def follow
    @user = User.find(params[:id])
    current_user.follow(@user)
    redirect_to users_path
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.unfollow(@user)
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :nickname, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
