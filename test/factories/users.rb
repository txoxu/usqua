# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.user_name + "example.com"}
    password { Faker::Internet.password }
  end
end
