# frozen_string_literal: true

module ScoreDecorator
    def total_score
        format('%+d', hole1_score.to_i + hole2_score.to_i + hole3_score.to_i + hole4_score.to_i + hole5_score.to_i + hole6_score.to_i +
        hole7_score.to_i + hole8_score.to_i + hole9_score.to_i + hole10_score.to_i + hole11_score.to_i + hole12_score.to_i +
        hole13_score.to_i + hole14_score.to_i + hole15_score.to_i + hole16_score.to_i + hole17_score.to_i + hole18_score.to_i)
      end
end
