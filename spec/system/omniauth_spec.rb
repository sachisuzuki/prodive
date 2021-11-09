require 'rails_helper'

RSpec.describe 'GoogleOAuth', type: :system do
  include OmniAuthHelpers
  describe 'OAuth認証(Google)機能' do
    before do
      OmniAuth.config.mock_auth[:google] = nil
      Rails.application.env_config['devise.mapping'] = Devise.mappings[:googleuser]
      Rails.application.env_config['omniauth.auth'] = mock_google_oauth
    end
    context 'Topページ下部のGmailでログインリンクから行く場合' do
      before do
        visit root_path
        find('.fa-angle-right').click
        sleep 3
      end
      it 'マイページに作成したユーザー名が表示される' do
        expect(page).to have_selector '.user-name', text: 'googleuser'
      end
      it '認証成功のフラッシュメッセージが出る' do
        expect(page).to have_content 'Google アカウントによる認証に成功しました'
      end
      it 'ヘッダーにログアウトリンクが表示される' do
        expect(page).to have_selector 'a', text: 'ログアウト'
      end
    end
    context 'ログインページのGmailでログインボタンから行く場合' do
      before do
        visit new_user_session_path
        first('.oauth-google').click
        sleep 2
      end
      it 'マイページに作成したユーザー名が表示される' do
        expect(page).to have_selector '.user-name', text: 'googleuser'
      end
      it '認証成功のフラッシュメッセージが出る' do
        expect(page).to have_content 'Google アカウントによる認証に成功しました'
      end
      it 'ヘッダーにログアウトリンクが表示される' do
        expect(page).to have_selector 'a', text: 'ログアウト'
      end
    end
    context 'アカウント登録ページのGmailでログインリンクから行く場合' do
      before do
        visit new_user_registration_path
        find('.google').click
      end
      it 'マイページに作成したユーザー名が表示される' do
        expect(page).to have_selector '.user-name', text: 'googleuser'
      end
      it '認証成功のフラッシュメッセージが出る' do
        expect(page).to have_content 'Google アカウントによる認証に成功しました'
      end
      it 'ヘッダーにログアウトリンクが表示される' do
        expect(page).to have_selector 'a', text: 'ログアウト'
      end
    end
  end
end
