# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Myapp
  # このクラスは、Myappのメインアプリケーションクラスであり、Railsフレームワークの初期化および構成を行います。
  # config/application.rbは、アプリケーション全体の設定を定義し、環境設定やミドルウェア、エンジンの設定などを
  # 含んでいます。このクラスはRails::Applicationを継承しており、Railsアプリケーションが起動される際に
  # 自動的にロードされます。
  #
  # 役割:
  # - アプリケーションの設定を一括管理
  # - ミドルウェアの構成
  # - カスタムイニシャライザのロード
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.generators do |g|
      g.skip_routes true
      g.helper false
      g.test_framework nil
    end

    config.i18n.default_locale = :ja

    config.assets.paths << Rails.root.join('app/assets/images')

    config.autoload_paths << Rails.root.join('app/uploaders')
    config.eager_load_paths << Rails.root.join('app/uploaders')
  end
end
