# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

require 'capybara/rails'
require 'capybara/minitest'

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    include FactoryBot::Syntax::Methods

    Capybara.register_driver :selenium_chrome_headless do |app|
      options = Selenium::WebDriver::Chrome::Options.new
      options.add_argument('--headless') # ヘッドレスモード
      options.add_argument('--no-sandbox') # セキュリティ制限の無効化
      options.add_argument('--disable-dev-shm-usage') # Docker環境でのメモリ制限回避

      Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
    end

    setup do
      Capybara.current_driver = :selenium_chrome_headless
    end

    # Add more helper methods to be used by all tests here...
  end
end
