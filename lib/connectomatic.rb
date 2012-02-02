require "connectomatic/version"

module Connectomatic

  def self.default_config
    ::ActiveRecord::Base.configurations[Rails.env]
  end

  def self.config_for(db_name)

    return default_config if db_name == :default

    config_path = "config/databases/#{db_name.to_s}.yml"
    config = YAML::load(File.open(config_path))
    config[Rails.env] || raise("Database configuration '#{config_path}' does not contain configuration for environment '#{Rails.env}'")
  end
end

if defined?(::Rails::Railtie)
    require 'connectomatic/railtie'
end
