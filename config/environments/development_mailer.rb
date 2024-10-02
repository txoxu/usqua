# frozen_string_literal: true

# メーラー設定
Rails.application.configure do
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.perform_caching = false
  config.action_mailer.default_url_options = { host: 'localhost:3000' }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: 'smtp.gmail.com',
    domain: 'gmail.com',
    port: 587,
    user_name: ENV['GOOGLE_MAIL_ADDRESS'],
    password: ENV['GOOGLE_APP_PASSWORD'],
    authentication: 'plain',
    enable_starttls_auto: true
  }
end
