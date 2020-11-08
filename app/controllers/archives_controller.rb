class ArchivesController < ApplicationController
    def index
        @scores = Score.all
        @score_round = Score.distinct.pluck(:course, :user_id, :round_id)

    end
    def show
        # @score_card = Score.
        @coursename = params[:round_id]
        @score_card_score = Score.where(round_id: params[:round_id]) #ホールごとのスコアを取得
        @score_care_course = Score.where(round_id: params[:round_id]).first #ラウンドしたコース、日付を取得
        @score_sum = Score.where(round_id: params[:round_id]).sum(:hole_score)
        # @sum_score = Score.group(:round_id).select("round_id,sum(hole_score) as sum_score ").order("sum_score")
        
    end
end
