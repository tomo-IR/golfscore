class UnpublishedsController < ApplicationController
  before_action :authenticate_user!
  def update
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
end
