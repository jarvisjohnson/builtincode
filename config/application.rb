require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Builtincode
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Use :UUID as primary key instead of :id:integer
    # http://www.mccartie.com/2015/10/20/default-uuid's-in-rails.html
    # config.generators do |g|
    #   g.orm :active_record, primary_key_type: :uuid
    # end

    # Rails.application.config.react.server_side = false

  end
end
