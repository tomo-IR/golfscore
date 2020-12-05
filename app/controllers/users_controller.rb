class UsersController < ApplicationController
  def index
    @user_all  = User.where.not(name: "ゲストプレイヤー").where.not(id: current_user.id).page(params[:page]).per(5)
    # .where.not(name: "ゲストプレイヤー").where.not(id: current_user.id)
    @users = User.search(params[:search]).where.not(name: "ゲストプレイヤー").where.not(id: current_user.id).page(params[:page]).per(5)
    
  end
  def show
    @user  = User.find(params[:id])
    @score = Score.where(user_id: params[:id]).distinct.pluck(:course, :user_id, :round_id, :created_at)
    @score_course = Score.where(user_id: params[:id]).distinct.pluck(:course, :user_id, :round_id, :created_at).first
    @score_sum = Score.where(user_id: params[:id]).group(:round_id).sum(:hole_score)
    @score_ave = Score.where(user_id: params[:id]).average(:hole_score)

  end
  def scorecard
    @coursename = params[:round_id]
    @score_card_score = Score.where(round_id: params[:round_id]) #ホールごとのスコアを取得
    @score_card_course = Score.where(round_id: params[:round_id]).first #ラウンドしたコース、日付を取得
    @score_sum = Score.where(round_id: params[:round_id]).sum(:hole_score)
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
