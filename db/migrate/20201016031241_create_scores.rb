class CreateScores < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|
      t.integer :hole_score
      t.string :course

      t.timestamps
    end
  end
end
