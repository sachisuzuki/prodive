class Area
  def self.options_for_enum
    { 関東: 0,
      北海道: 1,
      東北: 2,
      北陸: 3,
      中部・東海: 4,
      関西: 5,
      山陰: 6,
      四国: 7,
      九州: 8,
      沖縄: 9 }
  end

  def self.options_for_area
    area_list = []
    options_for_enum.each do |key, _value|
      area_list.push(key)
    end
    area_list
  end
end
