class HomeController < ApplicationController
  def index
    require "date"
    @day = DateTime.now
    # ラウンド途中のゴルフ場関係
    @now_playing = Score.where(:user_id => current_user)
                        .where("hole_score is NULL")
                        .distinct(:round_id)
                        .pluck(:round_id, :course)
  end

  def authentication; end

  #ゲストログイン関係
  def new_guest
    user = User.find_or_create_by!(:email => 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
    sign_in user
    redirect_to root_path, :notice => 'ゲストユーザーとしてログインしました。'
  end
end
