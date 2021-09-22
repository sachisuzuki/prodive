require 'rails_helper'

RSpec.describe Divesite, type: :model do
  describe 'ダイブサイト新規登録テスト' do
    context 'エリア、ゾーン、名前、緯度、経度がある' do
      it 'ダイブサイトが新規で作成される' do
        enough_info = FactoryBot.build(:divesite)
        expect(enough_info).to be_valid
      end
    end
    context 'エリアが空の場合' do
      it 'バリデーションエラー(areaのNull制約)となり失敗する' do
        empty_area = FactoryBot.build(:divesite, area: nil)
        expect(empty_area).not_to be_valid
      end
    end
    context 'ゾーンが空の場合' do
      it 'バリデーションエラー(zoneのNull制約)となり失敗する' do
        empty_zone = FactoryBot.build(:divesite, zone: nil)
        expect(empty_zone).not_to be_valid
      end
    end
    context '名前が空の場合' do
      it 'バリデーションエラー(nameのNull制約)となり失敗する' do
        empty_name = FactoryBot.build(:divesite, name: nil)
        expect(empty_name).not_to be_valid
      end
    end
    context '緯度が空の場合' do
      it 'バリデーションエラー(latitudeのNull制約)となり失敗する' do
        empty_latitude = FactoryBot.build(:divesite, latitude: nil)
        expect(empty_latitude).not_to be_valid
      end
    end
    context '経度が空の場合' do
      it 'バリデーションエラー(longitudeのNull制約)となり失敗する' do
        empty_longitude = FactoryBot.build(:divesite, longitude: nil)
        expect(empty_longitude).not_to be_valid
      end
    end
  end
end
