# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe '正常系' do
    it 'すべての必須項目が正しく入力された場合に登録できること' do
      expect(user.save).to be true
    end

    it '異なるnameであれば登録できること' do
      create(:user, name: 'aaa')
      user.name = 'bbb'
      expect(user.save).to be true
    end

    it '異なるemailであれば登録できること' do
      create(:user, email: 'aaa@example.com')
      user.email = 'bbb@example.com'
      expect(user.save).to be true
    end

    it 'passwordとpassword_confirmationが一致すれば登録できること' do
      user.password = 'abcdefj'
      user.password_confirmation = 'abcdefj'
      expect(user.save).to be true
    end

    it 'passwordが6文字以上128以下の場合に登録できること' do
      user.password = 'aaaaaa'
      expect(user.save).to be true
    end
  end

  describe '異常系' do
    context 'nameに関するテスト' do
      it 'nameが空の場合は登録できないこと' do
        user.name = ''
        expect(user.save).to be false
      end

      it 'nameがデータベース上で一意でない場合は登録できないこと' do
        create(:user, name: 'aaa')
        user.name = 'aaa'
        expect(user.save).to be false
      end

      it 'nameが255文字以上の場合は登録できないこと' do
        user.name = 'a' * 256
        expect(user.save).to be false
      end
    end

    context 'emailに関するテスト' do
      it 'emailが空の場合は登録できないこと' do
        user.email = ''
        expect(user.save).to be false
      end

      it 'emailがデータベース上に一意でない場合は登録できないこと' do
        create(:user, email: 'aaa@example.com')
        user.email = 'aaa@example.com'
        expect(user.save).to be false
      end

      it 'emailが@sample.comの形式ではない場合に登録できないこと' do
        user.email = 'abcdefg'
        expect(user.save).to be false
      end
    end

    context 'passwordに関するテスト' do
      it 'passwordが空の場合に登録できないこと' do
        user.password = ''
        expect(user.save).to be false
      end

      it 'passwordとpassword_confirmationが一致しない場合登録できないこと' do
        user.password = 'abcdefj'
        user.password_confirmation = 'jfedcba'
        expect(user.save).to be false
      end

      it 'passwordが5文字以下の場合に登録できないこと' do
        user.password = 'aaa'
        expect(user.save).to be false
      end

      it 'passwordが129文字以上の場合に登録できないこと' do
        user.password = 'a' * 129
        expect(user.save).to be false
      end
    end
  end
  pending "add some examples to (or delete) #{__FILE__}"
end
