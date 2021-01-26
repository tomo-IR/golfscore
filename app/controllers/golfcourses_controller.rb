class GolfcoursesController < ApplicationController
  before_action :auth_user, only: %i[play]
  
  def index
    @golfcoursename_all  = Golfcourse.all
                                      .page(params[:page]).per(5) #ページネーション
    @search_golfcoursename = Golfcourse.search(params[:search])
                                        .page(params[:page]).per(5) #ページネーション
  end

  def create
    @score = Score.new(new_score_params)
    @score.user_id = current_user.id
    @score.created_at = Time.now.all_day
    @score.status = 0
    if @score.save
      flash[:success] = 'ラウンド開始！！'
      redirect_to plays_edit_path(score_id: @score.id, hole_number: params[:start_hole])  
    else
      @golfcoursename_all  = Golfcourse.all.page(params[:page]).per(5) #ページネーション
      @search_golfcoursename = Golfcourse.search(params[:search]).page(params[:page]).per(5) #ページネーション
      flash.now[:danger] = 'ゴルフ場を選択してください。'
      render :index
    end
  end

  private

  def new_score_params
    params.permit(:golfcourse_id, :published, :played_date, :start_hole)
  end

  def auth_user
    player = Score.find(params[:id])
    if current_user.nil?
      flash[:alert] = "ログインしてください"
      redirect_to sign_in_path
    elsif player.user_id == current_user.id
      puts "成功"
    else
      flash[:alert] = "ログインしてください"
      redirect_to sign_in_path
    end
  end

end

