class PlaysController < ApplicationController
  before_action :authenticate_user!
  def edit
    @score = Score.find(params[:score_id])
  end

  def update
    @score = Score.find(params[:id])
    puts params[:hole_number]
    hole_number = params[:hole_number]
    hole_score = params[:hole_score]
    golfcourse_id = params[:golfcourse_id]
    puts hole_number
    puts hole_score
    @score.send("hole#{hole_number}_score=", hole_score)
    @score.user_id = current_user.id
    @score.thru = hole_number.to_i
    @score.save

    if @score.start_hole == 1 && @score.thru == 18
      @score.status = 1
      @score.save
      redirect_to score_path(score_id: @score.id, golfcourse_id: golfcourse_id)
      flash[:success] = 'ラウンドが終了しました！！'
    elsif @score.start_hole == 10 && @score.thru == 18
      redirect_to plays_edit_path(score_id: @score.id, hole_number: 1, golfcourse_id: golfcourse_id)
    elsif @score.start_hole == 10 && @score.thru == 9
      @score.status = 1
      @score.save
      redirect_to score_path(score_id: @score.id, golfcourse_id: golfcourse_id)
      flash[:success] = 'ラウンドが終了しました！！'
    else
      redirect_to plays_edit_path(score_id: @score.id, hole_number:hole_number.to_i + 1, golfcourse_id: golfcourse_id)
    end
  end
end
