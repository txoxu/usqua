# frozen_string_literal: true

class UserProvider < ApplicationRecord
  belongs_to :user, optional: true
end
