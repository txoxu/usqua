# frozen_string_literal: true

require 'active_support/core_ext/integer/time'

Rails.application.configure do
  # 開発環境専用の設定
  BetterErrors::Middleware.allow_ip! '0.0.0.0/0'

  # コードの自動リロード設定
  config.enable_reloading = true
  config.eager_load = false

  # エラーレポートおよびサーバータイミング
  config.consider_all_requests_local = true
  config.server_timing = true

  # キャッシュ設定
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true
    config.cache_store = :memory_store
    config.public_file_server.headers = { 'Cache-Control' => "public, max-age=#{2.days.to_i}" }
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end

  # Active Storage設定
  config.active_storage.service = :local

  # メーラー設定
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

  # その他の設定
  config.active_support.deprecation = :log
  config.active_support.disallowed_deprecation = :raise
  config.active_support.disallowed_deprecation_warnings = []

  config.active_record.migration_error = :page_load
  config.active_record.verbose_query_logs = true
  config.active_job.verbose_enqueue_logs = true

  config.assets.quiet = true

  config.action_controller.raise_on_missing_callback_actions = true
end
