class AddUserIdToScores < ActiveRecord::Migration[6.0]
  def change
    add_reference :scores, :user, foreign_key: true
  end
end
