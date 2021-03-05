class ArchivesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_score, only: %i(show edit update destroy)
  def index
    @scores =  Score.where(user_id: current_user.id)
                    .where(status: 1)
                    .includes([:golfcourse])  #.includes([:user] 
                    # .page(params[:page]).per(10)
    
    @scores_search = @scores.search(params[:played_year])

    @played_course_id = Score.where(user_id: current_user.id)
                          .where(status: 1)
                          .distinct.pluck(:golfcourse_id)

    @played_course_name = Golfcourse.where(id: @played_course_id)#重複なし

    @played_course_count = @scores_search.group(:golfcourse_id)
                                  .select("golfcourse_id, user_id, count(scores.id) as score_count")
                                  .order("score_count desc").preload(:golfcourse)
                                  .map { |m| [m.golfcourse.golfcoursename, m.score_count] }
                                  .to_h
  end

  def show
    playing_course = Score.find(params[:id])
    golfcourse_id = playing_course.golfcourse_id
    played_date = playing_course.played_date
    current_course_scores = Score.where(golfcourse_id: golfcourse_id, played_date: played_date) 
                                  .where.not(published: 0)
                                  .where.not(thru: nil)
                                  .includes([:user])  
                                    
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
  end

  def edit
    
  end

  def update
    if @score.update( :hole1_score => params[:hole1_score],
                      :hole2_score => params[:hole2_score],
                      :hole3_score => params[:hole3_score],
                      :hole4_score => params[:hole4_score],
                      :hole5_score => params[:hole5_score],
                      :hole6_score => params[:hole6_score],
                      :hole7_score => params[:hole7_score],
                      :hole8_score => params[:hole8_score],
                      :hole9_score => params[:hole9_score],
                      :hole10_score => params[:hole10_score],
                      :hole11_score => params[:hole11_score],
                      :hole12_score => params[:hole12_score],
                      :hole13_score => params[:hole13_score],
                      :hole14_score => params[:hole14_score],
                      :hole15_score => params[:hole15_score],
                      :hole16_score => params[:hole16_score],
                      :hole17_score => params[:hole17_score],
                      :hole18_score => params[:hole18_score],)
      flash[:edit_success] = 'スコアが編集されました'
      redirect_to archive_path
    else
      flash.now[:danger] = 'スコアが編集されませんでした'
      render 'archives/show'
    end
  end

  def create
  end

  def destroy
    if @score.destroy
      flash[:delete_success] = 'スコアが削除されました'
      redirect_to archives_path
    else
      flash[:delete_success] = 'スコアが削除できませんでした'
      redirect_to archives_path
    end 
  end

  private

  def set_score
    @score = Score.find(params[:id])
  end
end
