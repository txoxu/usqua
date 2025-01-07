require "application_system_test_case"

class NewRegistrationTest < ApplicationSystemTestCase
  test '1つのエラーの場合にバリデーションが表示されること' do
    user = FactoryBot.build(:user, name: nil)

    visit new_user_registration_path
    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: user.password
    fill_in 'パスワード確認', with: user.password_confirmation
    click_on '登録'

    assert_text "名前を入力してください"
  end

  test '2つのエラーの場合にバリデーションが表示されること' do
    user = FactoryBot.build(:user, name: nil, email: nil)

    visit new_user_registration_path
    fill_in 'パスワード', with: user.password
    fill_in 'パスワード確認', with: user.password_confirmation
    click_on '登録'

    assert_text "名前を入力してください"
    assert_text "メールアドレスを入力してください"
  end

  
end
