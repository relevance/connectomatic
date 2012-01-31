require 'connectomatic'

module Connectomatic
  class Railtie < Rails::Railtie
    initializer "connectomatic.active_record" do |app|
      if defined? ::ActiveRecord
        require 'connectomatic/active_record/base'
        ActiveRecord::Base.send(:extend, Connectomatic::ActiveRecord::Base::ClassMethods)
      end
    end

    initializer 'connectomatic.migrations' do |app|
      if defined? ::ActiveRecord
        require 'connectomatic/active_record/migration'
        ActiveRecord::Migration.send(:extend, Connectomatic::ActiveRecord::Migration::ClassMethods)
      end
    end
  end
end
