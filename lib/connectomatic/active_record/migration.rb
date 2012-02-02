require 'connectomatic'

module Connectomatic
  module ActiveRecord
    module Migration
      module ClassMethods

        def self.included(base)

          # Always reset the default connection when running a migration
          ::ActiveRecord::Migrator.class_eval do
            def ddl_transaction_with_reset(*args, &block)
              ::ActiveRecord::Base.establish_connection Connectomatic.config_for(:default)
              ddl_transaction_without_reset(*args, &block)
            end
            alias_method_chain :ddl_transaction, :reset
          end

          base.class_eval do
            def self.connectomatic(db_name)
              ::ActiveRecord::Base.establish_connection Connectomatic.config_for(db_name)
              ::ActiveRecord::Base.connection.initialize_schema_migrations_table
            end
          end
        end

      end
    end
  end
end
