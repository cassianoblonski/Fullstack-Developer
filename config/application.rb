# frozen_string_literal: true

require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_mailbox/engine'
require 'action_text/engine'
require 'action_view/railtie'
require 'action_cable/engine'
require 'sprockets/railtie'
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module UmanniTest
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Rails catchall messes with ActiveStorage routes
    # This is a fix, to load ActiveStorage first and unmatched_routes only on :all
    config.railties_order = [ActiveStorage::Engine, :main_app, :all]

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Don't generate system test files.
    config.generators.system_tests = nil

    # For more information about Locale Files organization, look at:
    # https://guides.rubyonrails.org/i18n.html#organization-of-locale-files
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    # Permitted locales available for the application
    I18n.available_locales = [:en, :'pt-BR']
    I18n.default_locale = :en
    I18n.locale = :en

    config.active_storage.variant_processor = :mini_magick
  end
end
