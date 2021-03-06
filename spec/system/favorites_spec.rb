# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Favorites', type: :system do
  describe 'お気に入りダイブサイト機能' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:divesite) { FactoryBot.create(:divesite) }
    before do
      sign_in(user)
    end
    context 'ダイブサイトをお気に入りに登録した場合' do
      before do
        visit divesite_path(divesite.id)
        find('.fa-meh').click
      end
      it 'フラッシュメッセージに登録したと表示される' do
        expect(page).to have_selector '.alert-info', text: 'お気に入りダイブサイトに登録しました'
      end
      it 'マイページにお気に入りにしたダイブサイト名が表示される' do
        visit mypage_user_path(user.id)
        expect(page).to have_content divesite.name
      end
    end
    context 'ダイブサイトお気に入りをはずした場合', js: true do
      before do
        visit divesite_path(divesite.id)
        find('.fa-meh').click
        find('.fa-laugh-squint').click
      end
      it 'フラッシュメッセージに削除したと表示される' do
        expect(page).to have_selector '.alert-secondary', text: 'お気に入りダイブサイトから削除しました'
      end
      it 'マイページにお気に入りから削除したダイブサイト名が表示されない' do
        visit mypage_user_path(user.id)
        expect(page).not_to have_content divesite.name
      end
    end
  end
end
