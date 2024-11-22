# frozen_string_literal: true

# 蒸留所のモデル
class Distillery < ApplicationRecord
  belongs_to :region
end
