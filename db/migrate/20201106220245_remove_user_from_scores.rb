class RemoveUserFromScores < ActiveRecord::Migration[6.0]
  def change
    remove_reference :scores, :user, null: false
  end
end
