class UsersController < ApplicationController
  def index
    @user  = User.all
  end
  def show
    @user  = User.find(params[:id])
  end
  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end
end
