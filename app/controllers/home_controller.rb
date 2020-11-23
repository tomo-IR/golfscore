class HomeController < ApplicationController
  def index
    require "date"
    @day = DateTime.now

    # ラウンド途中のゴルフ場関係
    
    @now_playing = Score.where("hole_score is NULL").distinct(:round_id).pluck(:round_id)
    # @playing_course = Score.where(round_id: now_playing).where("hole_score is NULL").distinct.pluck(:round_id)

    
  end

  def authentication
  end
end
