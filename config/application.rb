require File.expand_path('../boot', __FILE__)

require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "active_resource/railtie"


Bundler.require(:default, Rails.env) if defined?(Bundler)


module Hackerboard
  class Application < Rails::Application

		config.time_zone = 'Brasilia'
		config.i18n.load_path += Dir[Rails.root.join("config/locales/**/*.yml").to_s]
		config.i18n.default_locale = :en
    config.encoding = "utf-8"
    config.filter_parameters += [:password]
    config.active_support.escape_html_entities_in_json = true
    config.active_record.whitelist_attributes = true
		config.assets.enabled = false
  end
end
