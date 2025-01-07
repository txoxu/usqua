# frozen_string_literal: true

require 'test_helper'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  url = ENV.fetch("SELENIUM_REMOTE_URL", nil)
  options = if url
    { browser: :remote, url: url }
  end

  driven_by :selenium, using: :headless_chrome, options: options

  def setup
    Capybara.server_host = "0.0.0.0" # すべてのインターフェイスにバインドする
    Capybara.app_host = "http://#{IPSocket.getaddress(Socket.gethostname)}" if ENV["SELENIUM_REMOTE_URL"].present?
    super
  end

  
end
