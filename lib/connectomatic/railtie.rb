require 'connectomatic'
require 'connectomatic/active_record/base'
require 'connectomatic/active_record/migration'

module Connectomatic
  class Railtie < Rails::Railtie

    initializer "connectomatic.active_record" do |app|
      ActiveSupport.on_load(:active_record) do
        ::ActiveRecord::Base.send(:include, Connectomatic::ActiveRecord::Base::ClassMethods)
      end
    end

    initializer 'connectomatic.migrations' do |app|
      ActiveSupport.on_load(:active_record) do
        ::ActiveRecord::Migration.send(:include, Connectomatic::ActiveRecord::Migration::ClassMethods)
      end
    end
  end
end
