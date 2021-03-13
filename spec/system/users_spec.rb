require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context "ユーザー新規登録ができるとき" do
    it "正しい情報を入力すればユーザー新規登録ができてトップページに移動する" do
      # - トップページに移動する
      visit root_path
      # - トップページにサインアップページへ遷移するボタンがある
      expect(page).to have_content("新規登録") 
      # - 新規登録ページへ移動する
      visit new_user_registration_path
      # - ユーザー情報を入力する
      fill_in "nickname",	with: @user.nickname
      fill_in "email",	with: @user.email 
      fill_in "password",	with: @user.password 
      fill_in "password-confirmation",	with: @user.password_confirmation
      fill_in "last-name",	with: @user.last_name 
      fill_in "first-name",	with: @user.first_name
      fill_in "last-name-kana",	with: @user.last_name_kana 
      fill_in "first-name-kana",	with: @user.first_name_kana
      find("select[id='user_birthday_1i']").find("option[value='#{@user.birthday.year}']").select_option
      find("select[id='user_birthday_2i']").find("option[value='#{@user.birthday.month}']").select_option
      find("select[id='user_birthday_3i']").find("option[value='#{@user.birthday.day}']").select_option
      # - サインアップボタンを押すとユーザーモデルのカウントが1上がる
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      # - トップページへ遷移する
      expect(current_path).to eq root_path
      # - ニックネームとログアウトボタンが表示されている
      expect(page).to  have_content("#{@user.nickname}")
      expect(page).to  have_content("ログアウト")
      # - サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていない
      expect(page).to have_no_content("新規登録") 
      expect(page).to have_no_content("ログイン") 
    end
  end
  context "ユーザー新規登録ができないとき" do
  end
end

RSpec.describe 'ログイン', type: :system do
  before do
    # ユーザーの登録が完了している状態を再現するためにcreateを使う
    @user = FactoryBot.create(:user)
  end
  context "ログインができるとき" do
    it "保存されているユーザーの情報と合致すればログインができる" do
      # - トップページに移動する
      visit root_path
      # - トップページにログインページへ遷移するボタンがあることを確認する
      expect(page).to have_content("ログイン")
      # - ログインページへ遷移する
      visit new_user_session_path
      # - 正しいユーザー情報を入力する
      fill_in "email",with: @user.email
      fill_in "password",with: @user.password
      # - ログインボタンを押す
      find('input[name="commit"]').click
      # - トップページへ遷移したことを確認する
      expect(current_path).to eq root_path 
      # - ニックネームとログアウトボタンが表示されている
      expect(page).to  have_content("#{@user.nickname}")
      expect(page).to  have_content("ログアウト")
      # - サインアップページへ遷移するボタンやログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content("新規登録") 
      expect(page).to have_no_content("ログイン") 
    end
  end
  context "ログインができないとき" do
  end
end