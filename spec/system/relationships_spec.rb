# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Relationships', type: :system do
  describe 'フォロー機能' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:user02) { FactoryBot.create(:user02) }
    before do
      sign_in(user)
    end
    context 'ユーザーをフォローした場合' do
      before do
        visit user_path(user02.id)
        find('.unfollow').click
      end
      it 'フラッシュメッセージに登録したと表示される' do
        expect(page).to have_selector '.alert-info', text: 'フォローしました'
      end
      it 'マイページにフォローしたユーザー名が表示される' do
        visit mypage_user_path(user.id)
        expect(page).to have_content user02.name
      end
    end
    context 'ユーザーフォローをはずした場合' do
      before do
        user.follow(user02)
        visit user_path(user02.id)
        find('.follow').click
      end
      it 'フラッシュメッセージに解除したと表示される' do
        have_selector '.alert-secondary', text: 'フォローを解除しました'
      end
      it 'マイページにフォローをはずしたユーザー名は表示されない' do
        visit mypage_user_path(user.id)
        expect(page).not_to have_content user02.name
      end
    end
  end
end
