class AddHoleNumberToScores < ActiveRecord::Migration[6.0]
  def change
    add_column :scores, :hole_number, :integer
  end
end
