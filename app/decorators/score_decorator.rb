# frozen_string_literal: true

module ScoreDecorator
    def total_score
        format('%+d', hole1_score + hole2_score + hole3_score + hole4_score + hole5_score + hole6_score +
        hole7_score + hole8_score + hole9_score + hole10_score + hole11_score + hole12_score +
        hole13_score + hole14_score + hole15_score + hole16_score + hole17_score + hole18_score)
      end
end
