require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module Coloc
  class Application < Rails::Application
    config.load_defaults 8.0
    config.autoload_lib(ignore: %w[assets tasks])

    config.autoload_paths << "#{root}/app/resources"
    config.autoload_paths << "#{root}/app/components"
    config.autoload_paths << "#{root}/app/views"
    config.autoload_paths << "#{root}/app/views/layouts"
  end
end
