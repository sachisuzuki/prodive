require 'csv'
require 'securerandom'

# Users
30.times do |n|
  name = Faker::JapaneseMedia::StudioGhibli.character
  email = Faker::Internet.email
  password = "password"
	avatar = open("./public/samples/avt#{n}.jpg")
  uid = SecureRandom.uuid.tr('-', '')
  User.create!(name: name,
              email: email,
              password: password,
              avatar: avatar,
              uid: uid,
              )
end
User.create!(name: "admin_user",
            email: "admin@mail.com",
            password: "password",
            avatar: open("./public/images/default-avatar.png"),
            uid: SecureRandom.uuid.tr('-', ''),
            admin: true,
            )

# Divesites
CSV.foreach('db/Divesite.csv', headers: true) do |row|
  Divesite.create(area: row[0].to_i,
                  zone: row[1].to_i,
                  name: row[2],
                  address: row[3],
                  phone: row[4],
                  service: row[5],
                  discription: row[6],
                  latitude: row[7],
                  longitude: row[8],
                  )
end
