class ArchivesController < ApplicationController
  def index
    @scores = Score.all
    @score = Score.where(:user_id => current_user).distinct
                  .pluck(:course, :user_id, :round_id, :created_at )
    @score_sum = Score.where(:user_id => current_user)
                      .group(:round_id).sum(:hole_score)
    @score_ave = Score.where(:user_id => current_user)
                      .average(:hole_score)
  end

  def show
    @coursename = params[:round_id]
    @score_card_score = Score.where(:round_id => params[:round_id]) #ホールごとのスコアを取得
    @score_card_course = Score.where(:round_id => params[:round_id]).first #ラウンドしたコース、日付を取得
    @score_sum = Score.where(:round_id => params[:round_id]).sum(:hole_score)
    @score_ave = Score.where(:user_id => params[:id]).average(:hole_score)
  end

  def edit
    @coursename = params[:round_id]
    @score_card_score = Score.where(:round_id => params[:round_id]) #ホールごとのスコアを取得
    @score_card_course = Score.where(:round_id => params[:round_id]).first #ラウンドしたコース、日付を取得
    @score_sum = Score.where(:round_id => params[:round_id]).sum(:hole_score)
  end

  def edit_score
    @hole_number = params[:hole_number]
    @round_id = params[:round_id]
    @score = Score.find_by(:round_id => params[:round_id], :hole_number => params[:hole_number])
  end

  def hole_score_edit
  end    

  def create
  end

  def update
    @score = Score.find_by(:round_id => params[:round_id], :hole_number => params[:hole_number])
    if @score.update(:hole_score => params[:hoge])
      flash[:edit_success] = 'スコアが編集されました'
      redirect_to scorecard_edit_path(:round_id => params[:round_id])
    else
      flash.now[:danger] = 'スコアが編集されませんでした'
      render 'archives/show'
    end
  end

  def destroy_score_card
    @score = Score.where(:round_id => params[:round_id])
    @score.delete_all
    flash[:delete_success] = 'スコアが削除されました'
    redirect_to archives_index_path
  end
end