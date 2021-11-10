# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Divesites', type: :system do
  describe 'ダイブサイト一覧/電話発信機能' do
    let!(:user) { FactoryBot.create(:user) }
    before do
      sign_in(user)
    end
    context '海況MAPページでダイブサイトを選択する場合' do
      before do
        visit divesites_path
        page.all('.select-area')[0].click
        page.all('.zone')[1].click
        # map = find('#map', visible: false).native
        # page.driver.browser.action.move_to(map, 225, 215).click.perform
        # click_link("大瀬崎のページへ")
        click_link('大瀬崎')
      end
      it '選択したダイブサイトの詳細ページが表示される' do
        expect(page).to have_content '大瀬崎'
      end
      it '選択したダイブサイトの詳細ページにクリックできる電話番号がある' do
        expect(page).to have_selector 'a', text: '090-0000-0000'
      end
    end
  end
end
