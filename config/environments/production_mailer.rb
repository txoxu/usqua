# frozen_string_literal: true

# メーラー設定
Rails.application.configure do
  config.action_mailer.default_url_options = { host: 'usqua-b00a6d1e8961.herokuapp.com' }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: 'smtp.gmail.com',
    port: 587,
    domain: 'gmail.com',
    user_name: ENV['GOOGLE_MAIL_ADDRESS'],
    password: ENV['GOOGLE_APP_PASSWORD'],
    authentication: 'plain',
    enable_starttls_auto: true
  }
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.perform_caching = false
end
