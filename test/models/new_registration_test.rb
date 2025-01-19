# frozen_string_literal: true

require 'test_helper'

class NewRegistrationTest < ActiveSupport::TestCase
  # 正常系テスト
  test 'すべての必須項目が正しく入力された場合に登録できること' do
    user = FactoryBot.build(:user)
    assert user.save, 'ユーザーの作成に失敗しました'
  end

  test '異なるnameであれば登録できること' do
    user1 = FactoryBot.create(:user, name: 'aaa')
    user2 = FactoryBot.build(:user, name: 'bbb')

    assert user1.persisted?, 'ユーザー1が作成できませんでした'
    assert user2.save, 'ユーザー2が異なるnameで登録できませんでした'
  end

  test '異なるemailであれば登録できること' do
    user1 = FactoryBot.create(:user, email: 'aaa@example.com')
    user2 = FactoryBot.build(:user, email: 'bbb@example.com')
    assert user1.persisted?, 'ユーザー1が作成できませんでした'
    assert user2.save, 'ユーザー2が異なるemailでも登録できませんでした'
  end

  test 'passwordとpassword_confirmationが一致すれば登録できること' do
    user = FactoryBot.build(:user, password: 'abcdefj', password_confirmation: 'abcdefj')
    assert user.save, 'passwordとpassword_confirmationが一致しなくても登録出来ました'
  end

  test 'passwordが6文字以上128以下の場合に登録できること' do
    true_password = 'aaaaaa'
    user = FactoryBot.build(:user, password: true_password)
    assert user.save, '6文字以上128以下の場合でも登録できませんでした'
  end

  # 異常系テスト　name
  test 'nameが空の場合は登録できないこと' do
    user = FactoryBot.build(:user, name: '')
    assert_not user.save, 'nameが空でも登録できました'
  end

  test 'nameがデータベース上で一意でない場合は登録できないこと' do
    user1 = FactoryBot.create(:user, name: 'aaa')
    user2 = FactoryBot.build(:user, name: 'aaa')
    assert user1.persisted?, 'ユーザー1が作成できませんでした'
    assert_not user2.save, 'ユーザー2が登録出来ました'
  end

  test 'nameが255文字以上の場合は登録できないこと' do
    long_name = 'a' * 256
    user = FactoryBot.build(:user, name: long_name)
    assert_not user.save, 'nameが255文字以上でも登録出来ました'
  end

  # email
  test 'emailが空の場合は登録できないこと' do
    user = FactoryBot.build(:user, email: '')
    assert_not user.save, 'emailが空でも登録出来ました'
  end

  test 'emailがデータベース上に一意でない場合は登録できないこと' do
    user1 = FactoryBot.create(:user, email: 'aaa@example.com')
    user2 = FactoryBot.build(:user, email: 'aaa@example.com')
    assert user1.persisted?, 'ユーザー1が作成できませんでした'
    assert_not user2.save, 'ユーザー2が同じemailでも登録出来ました'
  end

  test 'emailが@sample.comの形式ではない場合に登録できないこと' do
    false_email = 'abcdefg'
    user = FactoryBot.build(:user, email: false_email)
    assert_not user.save, 'emailが@sample.comの形式ではなくても登録出来ました'
  end

  # password
  test 'passwordが空の場合に登録できないこと' do
    user = FactoryBot.build(:user, password: '')
    assert_not user.save, 'passwordが空でも登録出来ました'
  end

  test 'passwordとpassword_confirmationが一致しない場合登録できないこと' do
    user = FactoryBot.build(:user, password: 'abcdefj', password_confirmation: 'jfedcba')
    assert_not user.save, 'passwordとpassword_confirmationが一致しなくても登録出来ました'
  end

  test 'passwordが5文字以下の場合に登録できないこと' do
    short_password = 'aaa'
    user = FactoryBot.build(:user, password: short_password)
    assert_not user.save, 'passwordが5文字以下でも登録出来ました'
  end

  test 'passwordが129文字以上の場合に登録できないこと' do
    long_password = 'a' * 129
    user = FactoryBot.build(:user, password: long_password)
    assert_not user.save, 'passwordが129文字以上の場合でも登録出来ました'
  end
end
