class AddStartHoleToScores < ActiveRecord::Migration[6.0]
  def change
    add_column :scores, :start_hole, :integer
  end
end
