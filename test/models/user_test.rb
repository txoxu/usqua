# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # 正常系テスト
  test 'すべての必須項目が正しく入力された場合に登録できること' do
    user = FactoryBot.create(:user)
    assert user.save, 'ユーザーの作成に失敗しました'
  end

  test '異なるnameであれば登録できること' do
    user1 = User.create(name: "aaa", email: Faker::Internet.email, password: Faker::Internet.password)
    user1 = User.create(name: "bbb", email: Faker::Internet.email, password: Faker::Internet.password)
    assert user1.persisted, 'ユーザー1が異なるnameで登録できませんでした'
    assert user2.persisted, 'ユーザー2が異なるnameで登録できませんでした'
  end

  test '異なるemailであれば登録できること' do
    user1 = User.create(name: Faker::Name.name, email: 'aaa@example.com', password: Faker::Internet.password)
    user2 = User.create(name: Faker::Name.name, email: 'bbb@example.com', password: Faker::Internet.password)
    assert user1.persisted, 'ユーザー1が異なるemailでも登録できませんでした'
    assert user2.persisted, 'ユーザー2が異なるemailでも登録できませんでした'
  end

  test '異なるpasswordであれば登録できること' do
    user1 = User.create(name: Faker::Name.name, email: Faker::Internet.email, password: 'abcdefj')
    user2 = User.create(name: Faker::Name.name, email: Faker::Internet.email, password: 'jfedcba')
    assert user1.persisted, 'ユーザー1が異なるpasswordでも登録できませんでした'
    assert user2.persisted, 'ユーザー2が異なるpasswordでも登録できませんでした'
  end

  # 異常系テスト　name
  test 'nameが空の場合は登録できないこと' do
    user = User.new(name: "", email: Faker::Internet.email, password: Faker::Internet.password)
    assert_not user.save, 'nameが空でも登録できました'
  end

  test 'nameがデータベース上で一意でない場合は登録できないこと' do
    user1 = User.create(name: "aaa", email: Faker::Internet.email, password: Faker::Internet.password)
    user2 = User.new(name: "aaa", email: Faker::Internet.email, password: Faker::Internet.password)
    assert user1.persisted?, 'ユーザー1が登録できませんでした'
    assert_not user2.save, 'ユーザー2が登録出来ました'
  end

  test 'nameが255文字以上の場合は登録できないこと' do
    long_name = 'a' * 256
    user = User.new(name: long_name, email: Faker::Internet.email, password: Faker::Internet.password)
    assert_not user.save, 'nameが255文字以上でも登録出来ました'
  end

  #email
  test 'emailが空の場合は登録できないこと' do
    user = User.new(name: Faker::Name.name, email: "", password: Faker::Internet.password)
    assert_not user.save, 'emailが空でも登録出来ました'
  end

  test 'emailが255文字以上の場合は登録できないこと' do
    long_email = 'a' * 256 + '@sample.com'
    user = User.new(name: Faker::Name.name, email: long_email, password: Faker::Internet.password)
    assert_not user.save, 'emailが255文字以上の場合でも登録できました'
  end

  test 'emailがデータベース上に一意でない場合は登録できないこと' do
    user1 = User.create(name: Faker::Name.name, email: "aaa@example.com", password: Faker::Internet.password)
    user2 = User.save(name: Faker::Name.name, email: "aaa@example.com", password: Faker::Internet.password)
    assert user1.persisted?, 'ユーザー1が登録できませんでした'
    assert_not user2.save, 'ユーザー2が同じemailでも登録出来ました'
  end

  test 'emailが@sample.comの形式ではない場合に登録できないこと' do
    false_email = 'abcdefg'
    user = User.new(name: Faker::Name.name, email: false_email, password: Faker::Internet.password)
    assert_not user.save, 'emailが@sample.comの形式ではなくても登録出来ました'
  end

  #password
  test 'passwordが空の場合に登録できないこと' do
    user = User.new(name: Faker::Name.name, email: false_email, password: "")
    assert_not user.save, 'passwordが空でも登録出来ました'
  end

  test 'passwordがデータベース上で一意でない場合は登録できないこと' do
    user1 = User.create(name: Faker::Name.name, email: Faker::Internet.email, password: 'abcdefj')
    user2 = User.new(name: Faker::Name.name, email: Faker::Internet.email, password: 'abcdefj')
    assert user1.persisted?, 'ユーザー１が保存できませんでした'
    assert_not user2, save, '同じpasswordでユーザー2が登録出来ました'
  end

  test 'passwordが5文字以下の場合に登録できないこと' do
    short_password = 'aaa'
    user = User.new(name: Faker::Name.name, email: false_email, password: short_password)
    assert_not user.save, 'passwordが5文字以下でも登録出来ました'
  end
end
