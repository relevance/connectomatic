require "connectomatic/version"

module Connectomatic

  def self.config(db_name)
    YAML::load("config/databases/#{db_name.to_s}")[Rails.env]
  end

  def self.connection_for(db_name)
    handler = ActiveRecord::Base.connection_handler
    handler.establish_connection(db_name.to_s, config(db_name)
  end

# migration class methods

def connectomatic(db_name)
  @db_name = db_name
end

def connectomatic_connection(&block)
  @connection || Connectomatic.connection_for(db_name) if @db_name
  connection(&block)
end

alias_method_chain :connection, :connectomatic_connection
  
# end migration class methods

# model class methods

def connectomatic(db_name)
  establish_connection Connectomatic.config(db_name)
end

# end model class methods

if defined?(::Rails::Railtie)
    require 'connectomatic/railtie'
end



