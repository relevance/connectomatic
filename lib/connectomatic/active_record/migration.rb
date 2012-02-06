require 'connectomatic'

module Connectomatic
  module ActiveRecord
    module Migration
      module ClassMethods

        def self.included(base)

          base.class_eval do
            class << self
              def connectomatic(db_name)
                @db_name = db_name
              end

              def with_connection
                ::ActiveRecord::Base.establish_connection Connectomatic.config_for(@db_name || :default)
                yield
                ::ActiveRecord::Base.establish_connection Connectomatic.config_for(:default) if @db_name
              end
            end

            def up_with_connection(*args, &block)
              with_connection do
                up_without_connection
              end
            end

            def down_with_connection(*args, &block)
              with_connection do
                down_without_connection
              end
            end

            alias_method_chain :up, :connection
            alias_method_chain :down, :connection

          end
        end

      end
    end
  end
end
