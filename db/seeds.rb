require 'csv'

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
  User.create!(name: "admin_user",
              email: "admin@mail.com",
              password: password,
              avatar: open("./public/images/default-avatar.png"),
              uid: uid,
              admin: true,
              )
end

# Divesites
csv_data = CSV.read('db/Divesite.csv', headers: true)
csv_data.each do |data|
  Divesite.create!(data.to_hash)
end
