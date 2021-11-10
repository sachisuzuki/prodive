# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Condition, type: :model do
  describe '海況新規投稿テスト' do
    context 'ダイブポイント、ステータスがある' do
      it '海況投稿が新規で作成される' do
        enough_info = FactoryBot.build(:condition)
        expect(enough_info).to be_valid
      end
    end
    context 'ダイブポイントが空の場合' do
      it 'バリデーションエラー(divepointのNull制約)となり失敗する' do
        empty_divepoint = FactoryBot.build(:condition, divepoint: nil)
        expect(empty_divepoint).not_to be_valid
      end
    end
    context 'ステータスが空の場合' do
      it 'バリデーションエラー(statusのNull制約)となり失敗する' do
        empty_status = FactoryBot.build(:condition, status: nil)
        expect(empty_status).not_to be_valid
      end
    end
  end
end
