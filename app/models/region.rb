# frozen_string_literal: true

# 蒸溜所を分ける地方のテーブル
class Region < ApplicationRecord
  has_many :distilleries, dependent: :destroy
end
