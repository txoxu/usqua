# frozen_string_literal: true

# お問い合わせに関するモデル
class Contact < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :subject, presence: true
  validates :message, presence: true
end
