class Zone
  def self.options_for_enum
    all_zone_list = {}
    all_zone_list.merge(Zone.kanto_enum, Zone.hokkaido_enum, Zone.tohoku_enum, Zone.hokuriku_enum,
                        Zone.chubu_enum, Zone.kansai_enum, Zone.sanin_enum, Zone.shikoku_enum, Zone.kyushu_enum, Zone.okinawa_enum)
  end

  def self.kanto_enum
    { 東伊豆: 0,
      西伊豆: 1,
      南伊豆: 2,
      三浦・湘南: 3,
      房総半島: 4,
      伊豆諸島・小笠原: 5 }
  end

  def self.hokkaido_enum
    { 積丹半島: 6,
      知床半島: 7 }
  end

  def self.tohoku_enum
    { 秋田: 8,
      宮城: 9 }
  end

  def self.hokuriku_enum
    { 福井: 10,
      石川: 11 }
  end

  def self.chubu_enum
    { 三重: 12,
      山梨: 13 }
  end

  def self.kansai_enum
    { 京都: 14,
      和歌山: 15 }
  end

  def self.sanin_enum
    { 岡山: 16,
      山口: 17 }
  end

  def self.shikoku_enum
    { 愛媛: 18,
      高知: 19 }
  end

  def self.kyushu_enum
    { 大分: 20,
      鹿児島: 21 }
  end

  def self.okinawa_enum
    { 慶良間: 22,
      宮古島: 23 }
  end

  def self.options_for_kanto_zone
    zone_list = []
    kanto_enum.each do |key, _value|
      zone_list.push(key)
    end
    zone_list
  end

  def self.options_for_hokkaido_zone
    zone_list = []
    hokkaido_enum.each do |key, _value|
      zone_list.push(key)
    end
    zone_list
  end

  def self.options_for_tohoku_zone
    zone_list = []
    tohoku_enum.each do |key, _value|
      zone_list.push(key)
    end
    zone_list
  end

  def self.options_for_hokuriku_zone
    zone_list = []
    hokuriku_enum.each do |key, _value|
      zone_list.push(key)
    end
    zone_list
  end

  def self.options_for_chubu_zone
    zone_list = []
    chubu_enum.each do |key, _value|
      zone_list.push(key)
    end
    zone_list
  end

  def self.options_for_kansai_zone
    zone_list = []
    kansai_enum.each do |key, _value|
      zone_list.push(key)
    end
    zone_list
  end

  def self.options_for_sanin_zone
    zone_list = []
    sanin_enum.each do |key, _value|
      zone_list.push(key)
    end
    zone_list
  end

  def self.options_for_shikoku_zone
    zone_list = []
    shikoku_enum.each do |key, _value|
      zone_list.push(key)
    end
    zone_list
  end

  def self.options_for_kyushu_zone
    zone_list = []
    kyushu_enum.each do |key, _value|
      zone_list.push(key)
    end
    zone_list
  end

  def self.options_for_okinawa_zone
    zone_list = []
    okinawa_enum.each do |key, _value|
      zone_list.push(key)
    end
    zone_list
  end
end
