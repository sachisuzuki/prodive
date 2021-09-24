require 'rails_helper'

RSpec.describe "Conditions", type: :system do
  describe '海況投稿機能' do
    let!(:user){ FactoryBot.create(:user) }
    before do
      sign_in(user)
    end
    context 'ヘッダーの海況投稿ボタンから行く場合' do
      before do
        visit root_path
        click_link("海況投稿")
      end
      it '海況投稿画面が表示される' do
        expect(page).to have_content "海況情報投稿フォーム"
      end
    end
    context '海況MAPページ内の海況を投稿ボタンから行く場合' do
      before do
        visit divesites_path
        find('.goto-new').click
      end
      it '海況投稿画面が表示される' do
        expect(page).to have_content "海況情報投稿フォーム"
      end
    end
    context 'マイページ内自分の投稿一覧ページの投稿するボタンから行く場合' do
      before do
        visit mypage_user_path(user.id)
        click_link("自分の投稿一覧")
        find('.transition-btn').click
      end
      it '海況投稿画面が表示される' do
        expect(page).to have_content "海況情報投稿フォーム"
      end
    end
    context '海況投稿した場合' do
      let!(:new){ FactoryBot.build(:new_condition) }
      before do
        visit new_condition_path
        click_button "関東"
        click_button "西伊豆"
        click_button "大瀬崎"
        fill_in 'condition[divepoint]', with: new.divepoint
        choose 'OPEN'
        fill_in 'condition[temperature]', with: new.temperature
        fill_in 'condition[visibility]', with: new.visibility
        fill_in 'condition[content]', with: new.content
        find('.submit-btn').click
      end
      it '投稿の詳細画面が表示される' do
        expect(page).to have_selector '.alert-info', text: "本日の海況情報を投稿しました！"
        expect(page).to have_content "#{user.name}さんが投稿した"
        expect(page).to have_content "海況投稿テスト"
      end
    end
    context '海況投稿を削除した場合' do
      let!(:divesite){ FactoryBot.create(:divesite) }
      let!(:new){ FactoryBot.create(:condition, user_id: user.id, divesite_id: divesite.id) }
      before do
        visit mypage_user_path(user.id)
        click_link("自分の投稿一覧")
        page.all('.fa-angle-double-right')[0].click
        click_link("投稿を削除")
        page.accept_confirm
      end
      it 'フラッシュメッセージに削除と表示される' do
        expect(page).to have_selector '.alert-info', text: "海況情報を削除しました！"
      end
    end
  end
end
