class UsersController < ApplicationController
  def index
    @user_all  = User.where.not(name: "ゲストプレイヤー").where.not(id: current_user.id)
    @users = User.search(params[:search]).where.not(name: "ゲストプレイヤー").where.not(id: current_user.id)
    
  end
  def show
    @user  = User.find(params[:id])
    @score = Score.where(user_id: params[:id]).distinct.pluck(:course, :user_id, :round_id, :created_at)
    @score_course = Score.where(user_id: params[:id]).distinct.pluck(:course, :user_id, :round_id, :created_at).first
    @score_sum = Score.where(user_id: params[:id]).group(:round_id).sum(:hole_score)

  end
  def scorecard
  
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
