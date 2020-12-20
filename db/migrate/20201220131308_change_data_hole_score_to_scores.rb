class ChangeDataHoleScoreToScores < ActiveRecord::Migration[6.0]
  def change
    change_column :scores, :hole_score, :integer
  end
end
