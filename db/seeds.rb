# Users
5.times do |n|
  name = Faker::JapaneseMedia::StudioGhibli.character
  email = Faker::Internet.email
  password = "password"
	avatar = open("./public/samples/avt#{n}.jpg")
  uid = SecureRandom.uuid
  User.create!(name: name,
               email: email,
               password: password,
							 avatar: avatar,
               uid: uid,
               )
end
