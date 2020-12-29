class AddUserToScores < ActiveRecord::Migration[6.0]
  def change
    add_reference :scores, :user, :null => false, :foreign_key => true
  end
end
