class ScoresController < ApplicationController
  def show
    @score = Score.find(params[:id])

    
    # if @score.update(hole1_score: params[:hole1_score])
    #   # flash[:edit_success] = 'スコアが編集されました'
    #   # redirect_to golfcourse_play_path
    # else
    #   flash.now[:danger] = 'スコアが編集されませんでした'
    #   render golfcourse_play_path
    # end

   


    # リーダーボード関係
    playing_course = Score.find(params[:id])
    golfcourse_id = playing_course.golfcourse_id
    played_date = playing_course.played_date
    current_course_scores = Score.where(golfcourse_id: golfcourse_id, played_date: played_date) .includes([:user])
    @current_course_scores = current_course_scores.sort_by do |score|
      score.hole1_score.to_i + 
      score.hole2_score.to_i + 
      score.hole3_score.to_i + 
      score.hole4_score.to_i + 
      score.hole5_score.to_i + 
      score.hole6_score.to_i + 
      score.hole7_score.to_i + 
      score.hole8_score.to_i + 
      score.hole9_score.to_i + 
      score.hole10_score.to_i +
      score.hole11_score.to_i +
      score.hole12_score.to_i +
      score.hole13_score.to_i +
      score.hole14_score.to_i +
      score.hole15_score.to_i +
      score.hole16_score.to_i +
      score.hole17_score.to_i +
      score.hole18_score.to_i
    end

    # メッセージボード関係
		@message = Message.new
    @messages = Message.where(golfcourse_id: playing_course.golfcourse_id)
                        .order(created_at: "DESC")
                        .includes([:user])
                        .page(params[:page]).per(10)
  
  end
  def edit
    @score = Score.find(params[:id])
  end

  def update
      @score = Score.find(params[:id])
      @score.hole1_score = params[:score][:hole1_score]
      @score.save
  end
end
