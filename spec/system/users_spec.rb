# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'アカウント登録機能' do
    let!(:new_user) { FactoryBot.build(:user) }
    context 'ヘッダーのアカウント登録ボタンから行く場合' do
      before do
        visit root_path
        find('.fa-user-plus').click
      end
      it 'アカウント登録画面が表示される' do
        expect(page).to have_selector 'h2', text: 'アカウント登録'
      end
    end
    context 'Topページ下部のアカウント登録ボタンから行く場合' do
      before do
        visit root_path
        page.all('.transition-btn')[1].click
      end
      it 'アカウント登録画面が表示される' do
        expect(page).to have_selector 'h2', text: 'アカウント登録'
      end
    end
    context 'ログインページのアカウント登録ボタンから行く場合' do
      before do
        visit new_user_session_path
        click_link 'アカウント登録はこちら'
      end
      it 'アカウント登録画面が表示される' do
        expect(page).to have_selector 'h2', text: 'アカウント登録'
      end
    end
    context '新規でアカウント登録した場合' do
      before do
        visit new_user_registration_path
        fill_in 'user[name]', with: new_user.name
        fill_in 'user[email]', with: new_user.email
        fill_in 'user[password]', with: new_user.password
        fill_in 'user[password_confirmation]', with: new_user.password
        find('.actions').click
      end
      it 'マイページに作成したユーザー名が表示される' do
        expect(page).to have_selector '.user-name', text: new_user.name
      end
      it 'ヘッダーにログアウトリンクが表示される' do
        expect(page).to have_selector 'a', text: 'ログアウト'
      end
    end
  end
  describe 'ログイン機能' do
    context 'ヘッダーのログインボタンから行く場合' do
      before do
        visit root_path
        find('.fa-sign-in-alt').click
      end
      it 'ログイン画面が表示される' do
        expect(page).to have_selector 'h2', text: 'ログイン'
      end
    end
    context 'Topページ下部のログインボタンボタンから行く場合' do
      before do
        visit root_path
        first('.transition-btn').click
      end
      it 'ログイン画面が表示される' do
        expect(page).to have_selector 'h2', text: 'ログイン'
      end
    end
    context 'アカウント登録ページのログインボタンから行く場合' do
      before do
        visit new_user_registration_path
        find('.login-btn').click
      end
      it 'ログイン画面が表示される' do
        expect(page).to have_selector 'h2', text: 'ログイン'
      end
    end
    context 'ログインした場合' do
      let!(:user) { FactoryBot.create(:user) }
      before do
        visit new_user_session_path
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        find('.actions').click
      end
      it 'マイページに作成したユーザー名が表示される' do
        expect(page).to have_selector '.user-name', text: user.name
      end
      it 'ヘッダーにログアウトリンクが表示される' do
        expect(page).to have_selector 'a', text: 'ログアウト'
      end
    end
  end
  describe 'ゲストログイン(一般ユーザー)機能' do
    context 'Topページ下部のゲストログインボタンボタンから行く場合' do
      before do
        visit root_path
        first('.guest-login').click
      end
      it 'マイページにゲストが表示される' do
        expect(page).to have_selector '.user-name', text: 'ゲスト'
      end
      it 'ヘッダーにログアウトリンクが表示される' do
        expect(page).to have_selector 'a', text: 'ログアウト'
      end
    end
    context 'ログインページのゲストログインボタンから行く場合' do
      before do
        visit new_user_session_path
        first('.guest-login').click
      end
      it 'マイページにゲストが表示される' do
        expect(page).to have_selector '.user-name', text: 'ゲスト'
      end
      it 'ヘッダーにログアウトリンクが表示される' do
        expect(page).to have_selector 'a', text: 'ログアウト'
      end
    end
  end
  describe 'ゲストログイン(管理者)機能' do
    context 'Topページ下部のゲストログイン(管理者)ボタンボタンから行く場合' do
      before do
        visit root_path
        page.all('.guest-login')[1].click
      end
      it 'マイページにゲスト(管理者)が表示される' do
        expect(page).to have_selector '.user-name', text: 'ゲスト(管理者)'
      end
      it 'ヘッダーにログアウトリンクが表示される' do
        expect(page).to have_selector 'a', text: 'ログアウト'
      end
      it 'ヘッダーに管理者画面リンクが表示される' do
        expect(page).to have_selector 'a', text: '管理者画面'
      end
    end
    context 'ログインページのゲスト(管理者)ログインボタンから行く場合' do
      before do
        visit new_user_session_path
        page.all('.guest-login')[1].click
      end
      it 'マイページにゲストが表示される' do
        expect(page).to have_selector '.user-name', text: 'ゲスト(管理者)'
      end
      it 'ヘッダーにログアウトリンクが表示される' do
        expect(page).to have_selector 'a', text: 'ログアウト'
      end
      it 'ヘッダーに管理者画面リンクが表示される' do
        expect(page).to have_selector 'a', text: '管理者画面'
      end
    end
  end
  describe '管理者機能' do
    let!(:admin_user) { FactoryBot.create(:admin_user) }
    context '管理者アカウントでログインした場合' do
      before do
        visit new_user_session_path
        fill_in 'user[email]', with: admin_user.email
        fill_in 'user[password]', with: admin_user.password
        find('.actions').click
        click_link '管理者画面'
      end
      it 'サイト管理のダッシュボードにアクセスできる' do
        expect(page).to have_content 'サイト管理'
      end
    end
  end
end
