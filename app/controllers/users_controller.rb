class UsersController < ApplicationController
  def index
    # @user  = User.where.not(name: "ゲストプレイヤー").where.not(id: current_user.id)
    @users = User.search(params[:search]).where.not(name: "ゲストプレイヤー").where.not(id: current_user.id)
    
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
