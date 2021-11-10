# frozen_string_literal: true

6.times do |n|
  divepoint = %w[前浜 後浜 横浜 右浜 左浜 上浜 下浜 ビーチ ボート お魚団地 やぐら 沖の浜 クレパス]
  status = [0, 1, 0, 2, 0, 1, 0] # OPENを多めに配置
  temperature = (10..25).to_a
  visibility = (3..25).to_a
  content = ['黒潮にのってジンベイザメきてます！！',
             'エントリー/エキジット時に波有。水中に入ってまえば透明度良し！',
             '台風が近づいており波が高いです',
             '透明度もよく波も穏やかで初心者講習にも向いています',
             '魚影も濃くダイビング日和です',
             'マクロのアイドルがたくさん出没中です！カメラ派のダイバーにおすすめ♪']
  image = ['condition0.mp4', 'condition1.jpg', 'condition2.jpg',
           'condition3.jpg', 'condition4.jpg', 'condition5.mp4',
           'condition6.mp4', 'condition7.jpg', 'condition8.jpg',
           'condition9.jpg', 'condition10.jpg', 'condition11.jpg',
           'condition12.jpg', 'condition13.mp4']
  i = rand(0..13)
  Condition.create!(divepoint: divepoint.sample,
                    status: status.sample,
                    temperature: temperature.sample,
                    visibility: visibility.sample,
                    content: content.sample,
                    image: open("#{Rails.root}/public/samples/#{image[i]}"),
                    user_id: (n + 1) + 1,
                    divesite_id: n + 1)
end

# 30.times do |n|
#   divepoint = ["前浜", "後浜", "横浜", "右浜", "左浜", "上浜", "下浜", "ビーチ", "ボート", "お魚団地", "やぐら", "沖の浜", "クレパス",]
#   status = [0, 1, 0, 2, 0, 1, 0]  # OPENを多めに配置
#   temperature = (10..25).to_a
# 	visibility = (3..25).to_a
#   content = [ "黒潮にのってジンベイザメきてます！！",
#               "エントリー/エキジット時に波有。水中に入ってまえば透明度良し！",
#               "台風が近づいており波が高いです",
#               "透明度もよく波も穏やかで初心者講習にも向いています",
#               "魚影も濃くダイビング日和です",
#               "マクロのアイドルがたくさん出没中です！カメラ派のダイバーにおすすめ♪",
#             ]
#   image = [ "condition0.mp4", "condition1.jpg", "condition2.jpg",
#             "condition3.jpg", "condition4.jpg", "condition5.mp4",
#             "condition6.mp4", "condition7.jpg", "condition8.jpg",
#             "condition9.jpg", "condition10.jpg","condition11.jpg",
#             "condition12.jpg", "condition13.mp4",
#           ]
#   i = rand(0..13)
#   Condition.create!(divepoint: divepoint.sample,
#                     status: status.sample,
#                     temperature: temperature.sample,
#                     visibility: visibility.sample,
#                     content: content.sample,
#                     image: open("#{Rails.root}/public/samples/#{image[i]}"),
#                     user_id: (n+1)+1,
#                     divesite_id: n+1,
#                     )
# end
