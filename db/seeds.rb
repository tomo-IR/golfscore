# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do |n|
  name  = "example-#{n+1}"
  email = "example-#{n+1}@example.com"
  password = "password"
  User.create!(name:  name,
              email: email,
              password:              password,
              password_confirmation: password)
  # content = "message-example-#{n+1}"
  # golfcourse_id = n+1
  # user_id = n+1
  # Message.create!(content: content,
  #                 golfcourse_id: golfcourse_id,
  #                 user_id: user_id)
end
