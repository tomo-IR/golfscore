class HomeController < ApplicationController
  def index
    require "date"
    @day = DateTime.now

    # ラウンド途中のゴルフ場関係
    now_playing = Score.where(hole_score: nil).distinct.pluck(:round_id)
    @playing_course = Score.where(round_id: now_playing)
  end

  def authentication
  end
end
