# frozen_string_literal: true

require 'active_support/core_ext/integer/time'
require_relative 'production_mailer'
require_relative 'production_logger'

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

  # I18n設定
  config.i18n.fallbacks = true

  # デバッグ情報設定
  config.active_support.report_deprecations = false

  # マイグレーション後にスキーマをダンプしない
  config.active_record.dump_schema_after_migration = false
end
