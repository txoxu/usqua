# frozen_string_literal: true

require 'active_support/core_ext/integer/time'

Rails.application.configure do
  # リクエスト間でコードをリロードしない設定
  config.enable_reloading = false
  config.eager_load = true

  # エラーレポートの無効化およびキャッシュの有効化
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true

  # アセットパイプラインの設定
  config.assets.compile = false

  # Active Storage設定
  config.active_storage.service = :local

  # 強制SSL設定
  config.force_ssl = true

  # ログ設定
  config.logger = ActiveSupport::Logger.new($stdout)
                                       .tap  { |logger| logger.formatter = ::Logger::Formatter.new }
                                       .then { |logger| ActiveSupport::TaggedLogging.new(logger) }
  config.log_tags = [:request_id]
  config.log_level = ENV.fetch('RAILS_LOG_LEVEL', 'info')

  # メーラー設定
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

  # I18n設定
  config.i18n.fallbacks = true

  # デバッグ情報設定
  config.active_support.report_deprecations = false

  # マイグレーション後にスキーマをダンプしない
  config.active_record.dump_schema_after_migration = false
end
