class ArchivesController < ApplicationController
  def index
    @scores =  Score.where(user_id: current_user.id).includes([:user]).includes([:golfcourse])
  end

  def show
    @score = Score.find(params[:id])
  end

  def edit
    @score = Score.find(params[:id])
  end

  def update
    @score = Score.find(params[:id])
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
                      :hole18_score => params[:hole18_score],
                    
                    
                    )
      flash[:edit_success] = 'スコアが編集されました'
      redirect_to archives_show_path
    else
      flash.now[:danger] = 'スコアが編集されませんでした'
      render 'archives/show'
    end
    # @score = Score.find(params[:id])

    # if @score.update(hole1_score: params[:hole1_score])
    #   flash[:success] = 'score は正常に更新されました'
    #   redirect_to archives_show_path
    # else
    #   flash.now[:danger] = 'score は更新されませんでした'
    #   render :edit
    # end
  end

  def hole_score_edit
  end    

  def create
  end

  # def update
  #   @score = Score.find_by(:round_id => params[:round_id], :hole_number => params[:hole_number])
  #   if @score.update(:hole_score => params[:hoge])
  #     flash[:edit_success] = 'スコアが編集されました'
  #     redirect_to scorecard_edit_path(:round_id => params[:round_id])
  #   else
  #     flash.now[:danger] = 'スコアが編集されませんでした'
  #     render 'archives/show'
  #   end
  # end

  def destroy_score_card
    @score = Score.where(:round_id => params[:round_id])
    @score.delete_all
    flash[:delete_success] = 'スコアが削除されました'
    redirect_to archives_index_path
  end
end
