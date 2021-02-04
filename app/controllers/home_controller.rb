class HomeController < ApplicationController
  def index
    require "date"
    @day = DateTime.now
    # ラウンド途中のゴルフ場関係
    if current_user.nil?
      puts "ログアウト中です"
    else
      @unfinished_score = Score.where(user_id: current_user.id)
                              .where(status: 0)
                              .includes([:golfcourse])
      @user = User.find(current_user.id)
      @following_user = @user.followings
      @following_user_id = []
      @following_user.each do|score|
        @following_user_id.push(score.id)
      end
    end

    from  = Time.current.at_beginning_of_day + 1.day
    to    = (from - 7.day).at_end_of_day

    @following_score = Score.where(user_id: @following_user_id)
                            .where(published: 1)
                            .where(played_date: to...from) 
                            .order(played_date: :desc)
                            .includes([:user])
                            .includes([:golfcourse])

  end

  def authentication
  end

  #ゲストログイン関係
  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.name = "ゲストプレイヤー"
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
    sign_in user
    redirect_to root_path, :notice => 'ゲストプレイヤーとしてログインしました。'
  end



end
