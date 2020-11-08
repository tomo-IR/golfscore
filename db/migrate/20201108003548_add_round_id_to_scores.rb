class AddRoundIdToScores < ActiveRecord::Migration[6.0]
  def change
    add_column :scores, :round_id, :string
  end
end
