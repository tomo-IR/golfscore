class ArchivesController < ApplicationController
  before_action :set_score, only: %i(show edit update destroy)
  def index
    @scores =  Score.where(user_id: current_user.id).includes([:user]).includes([:golfcourse])
  end

  def show
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
      redirect_to archives_show_path
    else
      flash.now[:danger] = 'スコアが編集されませんでした'
      render 'archives/show'
    end
  end

  def hole_score_edit
  end    

  def create
  end

  def destroy
    if @score.destroy
      flash[:delete_success] = 'スコアが削除されました'
      redirect_to root_path
    else
      flash[:delete_success] = 'スコアが削除できませんでした'
      redirect_to root_path
    end 
  end

  def score_published
    @score = Score.find(params[:id])
    @score.published = 1
    if @score.save
      flash[:edit_success] = 'このラウンドのスコアを公開しました。'
      redirect_to archives_index_path
    else
      flash[:delete_success] = 'このラウンドのスコアを非公開にできませんでした'
      redirect_to root_path
    end
  end
  
  def score_unpublished
    @score = Score.find(params[:id])
    @score.published = 0
    if @score.save
      flash[:edit_success] = 'このラウンドのスコアを非公開にしました。'
      redirect_to archives_index_path
    else
      flash[:edit_success] = 'このラウンドのスコアを非公開にしました。'
      render root_path
    end
  end
  
  private

  def set_score
    @score = Score.find(params[:id])
  end
end
