# load(Rails.root.join( 'db', 'seeds', "#{Rails.env.downcase}.rb"))

# Dir.glob("#{Rails.root}/db/seeds/*.yml").each do |yaml_filename|
#   # yamlのファイル名から、対応するモデルクラスを特定し、クラスをロードする
#   # 下記行が無いと、「ArgumentError: undefined class/module」が発生する。
#   target_model = File.basename(yaml_filename,".yml").classify.constantize
#   # すでに登録されているデータを全県削除
#   target_model.delete_all

#   # yamlに記述されたレコードをDBに登録する。
#   File.open(yaml_filename) do |load_target_yaml|
#     records = YAML.load(load_target_yaml)

#     records.each do |record|
#       target_model.create(record.attributes)
#     end
#   end
# end

require 'csv'
require 'securerandom'

# Users
5.times do |n|
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

# Conditions
5.times do |n|
  divepoint = ["前浜", "後浜", "横浜", "上浜", "下浜",]
  status = [0, 1, 2, 0, 0]
  temperature = 20
	visibility = 15
  content = ["ジンベイザメきてます！！",
            "エントリー/エキジット時に波有。水中に入ってまえば透明度良し！",
            "台風が近づいており波が高いのでCLOSEします",
            "透明度もよく波も穏やかで初心者講習にも向いています",
            "魚影も濃くダイビング日和",
            ]
  image = ["condition4.jpg", "condition1.jpg", "condition2.jpg", "condition0.mp4", "condition3.jpg",]
  Condition.create!(divepoint: divepoint[n],
                    status: status[n],
                    temperature: temperature,
                    visibility: visibility,
                    content: content[n],
                    image: open("./public/samples/#{image[n]}"),
                    user_id: n+1,
                    divesite_id: n+1,
                    )
end
