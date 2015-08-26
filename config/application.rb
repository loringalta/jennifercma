require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Jennifercma
  class Application < Rails::Application
    config.before_initialize do |app|
      app.config.paths.add 'app/models/values', eager_load: true
    end
    config.autoload_paths += %W(#{config.root}/lib)
    config.to_prepare do
      Dir[File.expand_path(Rails.root.join('app/models/values/*.rb'))].each do |file|
        require_dependency file
      end
    end
    config.active_record.raise_in_transactional_callbacks = true
  end
end
