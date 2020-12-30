class CreateGolfcourses < ActiveRecord::Migration[6.0]
  def change
    create_table :golfcourses do |t|
      t.integer :golfcourseid
      t.string :golfcoursename
      t.integer :areacode
      t.integer :prefecture

      t.timestamps
    end
  end
end
