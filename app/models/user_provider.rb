class UserProvider < ApplicationRecord
  belongs_to :user, optional: true
end
