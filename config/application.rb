require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CreativeDo
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.autoload_paths << Rails.root.join('lib')
    config.autoload_paths += Dir[Rails.root.join('app', 'services')]
    config.autoload_paths += Dir[Rails.root.join('app', 'forms')]
    config.filter_parameters += [:password]
    config.generators do |g|
      g.fixture_replacement :factory_girl
    end

    # paperclip
    # Makes sure the file name is dynamic for CDN support
    config.paperclip_defaults = {
        :url => 'assets/:id/:style/:basename.:extension',
        :path => ':attachment/:id_partition/:style/:updated_at.:extension'
    }
  end
end
