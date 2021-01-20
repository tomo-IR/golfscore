class AddThruToScores < ActiveRecord::Migration[6.0]
  def change
    add_column :scores, :thru, :integer
  end
end
