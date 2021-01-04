class CreateGolfcourses < ActiveRecord::Migration[6.0]
  def change
    create_table :golfcourses do |t|
      t.integer :golfcourseid
      t.string :golfcoursename
      t.string :golfcourseabbr
      t.string :golfcoursenamekana
      t.text :golfcoursecaption
      t.string :address

      t.timestamps
    end
  end
end
