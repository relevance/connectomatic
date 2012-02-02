require "connectomatic/version"

module Connectomatic
  def self.config_for(db_name)
    config_path = "config/databases/#{db_name.to_s}.yml"
    config = YAML::load(File.open(config_path))
    config[Rails.env] || raise("Database configuration '#{config_path}' does not contain configuration for environment '#{Rails.env}'")
  end
end

if defined?(::Rails::Railtie)
    require 'connectomatic/railtie'
end



