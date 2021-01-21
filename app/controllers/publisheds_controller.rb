class PublishedsController < ApplicationController
  def update
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
end
