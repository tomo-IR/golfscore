class ChangeDatatype < ActiveRecord::Migration[6.0]
  def change
    change_column :scores, :hole_score, :string
  end
end
