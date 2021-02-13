class UsersController < ApplicationController
  def index
    @users = User.search(params[:search])
                  .where.not(:name => "ゲストプレイヤー")
                  .where.not(:id => current_user.id)
                  .page(params[:page]).per(10) #ページネーション
  end

  def show
    @user  = User.find(params[:id])
    @score = @user.scores.includes([:golfcourse])

  end
  def scorecard
    @coursename = params[:round_id]
    @score_card_score = Score.where(:round_id => params[:round_id]) #ホールごとのスコアを取得
    @score_card_course = Score.where(:round_id => params[:round_id]).first #ラウンドしたコース、日付を取得
    @score_sum = Score.where(:round_id => params[:round_id]).sum(:hole_score)
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

  def update
    @user = User.find(current_user.id)
    if @user.update!(:name => params[:user][:name], :avatar => params[:user][:avatar])
        flash[:edit_success] = '編集されました'
        redirect_to mypage_edit_path

    else
        flash.now[:danger] = 'スコアが編集されませんでした'
        render 'mypages/index'
    end
  end
  
end
