# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'NewRegistrations', type: :system do
  before do
    driven_by(:rack_test)
  end

  pending "add some scenarios (or delete) #{__FILE__}"

  it '1つのエラーの場合にバリデーションが表示されること' do
    user = FactoryBot.build(:user, name: nil)

    visit new_user_registration_path
    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: user.password
    fill_in 'パスワード確認', with: user.password_confirmation
    click_on '登録'

    expect(page).to have_text('名前を入力してください')
  end

  it '2つのエラーの場合にバリデーションが表示されること' do
    user = FactoryBot.build(:user, name: nil, email: nil)

    visit new_user_registration_path
    fill_in 'パスワード', with: user.password
    fill_in 'パスワード確認', with: user.password_confirmation
    click_on '登録'

    expect(page).to have_text('名前を入力してください')
    expect(page).to have_text('メールアドレスを入力してください')
  end
end
