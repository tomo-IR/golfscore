class AddGolfcoursesIdToMessages < ActiveRecord::Migration[6.0]
  def change
    add_reference :messages, :golfcourse, foreign_key: true
  end
end
