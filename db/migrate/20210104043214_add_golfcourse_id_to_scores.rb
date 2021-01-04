class AddGolfcourseIdToScores < ActiveRecord::Migration[6.0]
  def change
    add_reference :scores, :golfcourse, foreign_key: true
  end
end
