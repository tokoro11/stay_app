require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Stay2
  class Application < Rails::Application
    config.load_defaults 7.0
    config.active_storage.variant_processor = :mini_magick

    # 表示用タイムゾーン（日本時間）
    config.time_zone = 'Tokyo'

    # DBは UTC で保存（Rails標準）
    config.active_record.default_timezone = :utc
  end
end
