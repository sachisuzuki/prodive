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
                    image: open("#{Rails.root}/public/samples/#{image[n]}"),
                    user_id: n+1,
                    divesite_id: n+1,
                    )
end
