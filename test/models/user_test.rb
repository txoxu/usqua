# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should create a valid user' do
    user = FactoryBot.create(:user)
    assert user.valid? # 作成されたuserが有効か確認
  end
end
