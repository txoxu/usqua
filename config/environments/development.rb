# frozen_string_literal: true

require 'active_support/core_ext/integer/time'
require_relative 'development_mailer'
require_relative 'development_cache'

Rails.application.configure do
  # 開発環境専用の設定
  BetterErrors::Middleware.allow_ip! '0.0.0.0/0'

  # コードの自動リロード設定
  config.enable_reloading = true
  config.eager_load = false

  # エラーレポートおよびサーバータイミング
  config.consider_all_requests_local = true
  config.server_timing = true

  # Active Storage設定
  config.active_storage.service = :local

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
