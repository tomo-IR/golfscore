class HomeController < ApplicationController
  def index
    require "date"
    @day = DateTime.now

    # ラウンド途中のゴルフ場関係
    
    @now_playing = Score.where(user_id: current_user).where("hole_score is NULL").distinct(:round_id).pluck(:round_id, :course)
    # @playing_course = Score.where(round_id: now_playing).where("hole_score is NULL").distinct.pluck(:round_id)

    # play_date = Score.where(round_id: params[:round_id]).first
      # @ou = Score.where(created_at: play_date.created_at.in_time_zone.all_day).where(course: params[:course]).where.not(hole_score: nil).group(:round_id).select("round_id,sum(hole_score) as overunder").order("overunder")
     
  end

  def authentication
  end
  #ゲストログイン関係
  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
