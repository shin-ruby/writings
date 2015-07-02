# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(email: "shin.php@gmail.com", 
						 username: "Shin",
						 password: "ps2ps2ps2",
						 password_confirmation: "ps2ps2ps2")

99.times do |n|
	username = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(email: email,
  						 username: username,
               password: password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
50.times do
	title = Faker::Lorem.word
	content = Faker::Lorem.sentence(5)
	photo = Faker::Avatar.image("my-own-slug")
	users.each { |user| user.writings.create!(title: title, content: content, photo: photo)}
end
