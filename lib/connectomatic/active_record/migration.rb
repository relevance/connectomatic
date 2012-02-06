require 'connectomatic'

module Connectomatic
  module ActiveRecord
    module Migration
      module ClassMethods

        def self.included(base)

          base.class_eval do
            class << self

              def migrate_with_connectomatic(direction)
                using_connectomatic do
                  migrate_without_connectomatic(direction)
                end
              end

              def using_connectomatic
                ::ActiveRecord::Base.establish_connection Connectomatic.config_for(@db_name || :default)
                yield
                ::ActiveRecord::Base.establish_connection Connectomatic.config_for(:default) if @db_name
              end

              def connectomatic(db_name)
                @db_name = db_name

                self.class_eval do
                  class << self
                    alias_method_chain :migrate, :connectomatic
                  end
                end
              end

            end
          end
        end
      end
    end
  end
end
