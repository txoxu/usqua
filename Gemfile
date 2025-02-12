# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.3'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.1.3', '>= 7.1.3.2'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# Use mysql as the database for Active Record
gem 'mysql2', '~> 0.5'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '>= 5.0'

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem 'jsbundling-rails'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'

gem 'importmap-rails'

# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem 'cssbundling-rails'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# デバックを容易にするgem
gem 'better_errors', '~> 2.10', '>= 2.10.1'

gem 'binding_of_caller', '~> 1.0', '>= 1.0.1'

gem 'jquery-rails'

gem 'carrierwave', '~> 3.0', '>= 3.0.7'

gem 'ransack', '~> 4.1', '>= 4.1.1'

gem 'chartkick'

gem 'gretel', '~> 5.0'

gem 'sorcery', '~> 0.17.0'

gem 'rails-i18n', '~> 7.0', '>= 7.0.9'

gem 'draper', '~> 4.0', '>= 4.0.2'

gem 'kaminari', '~> 1.2', '>= 1.2.2'

gem 'bootstrap-kaminari-views', '~> 0.0.5'

gem 'googleauth', '~> 1.11'

gem 'devise'

gem 'omniauth'

gem 'omniauth-google-oauth2'

gem 'omniauth-rails_csrf_protection'

gem 'dotenv-rails', groups: %i[development test]

gem 'pry-byebug'

gem 'meta-tags'

gem 'sassc-rails'

gem 'httparty'

gem 'bootstrap', '~> 5.3.3'

# Use Redis adapter to run Action Cable in production
# gem "redis", ">= 4.0.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[windows jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem 'image_processing', '~> 1.2'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri windows]

  gem 'factory_bot_rails'

  gem 'faker'

  gem 'letter_opener_web', '~> 3.0'

  gem 'rspec-rails', '~> 7.0', '>= 7.0.1'

  gem 'rubocop', '~> 1.63', '>= 1.63.5'

  gem 'rubocop-capybara'

  gem 'rubocop-rails'

  gem 'rubocop-rspec_rails'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'brakeman'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
