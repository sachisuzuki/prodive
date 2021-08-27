class Zone
  def self.options_for_enum
    { 東伊豆: 0,
      西伊豆: 1,
      南伊豆: 2,
      三浦・湘南: 3,
      房総半島: 4,
      伊豆諸島・小笠原: 5,
      積丹半島: 6,
      ウトロ: 7,
      秋田: 8,
      宮城: 9,
      福井: 10,
      石川: 11,
      三重: 12,
      山梨: 13,
      京都: 14,
      和歌山: 15,
      岡山: 16,
      山口: 17,
      愛媛: 18,
      高知: 19,
      大分: 20,
      鹿児島: 21,
      慶良間: 22,
      宮古島: 23,
    }
  end
  def self.options_for_zone
    zone_list = []
    self.options_for_enum.each do | key, value |
      zone_list.push([ key, key ])
    end
    return zone_list
  end
end
