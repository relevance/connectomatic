require 'connectomatic'

module Connectomatic
  module ActiveRecord
    module Base
      module ClassMethods

        def connectomatic(db_name)
          puts "establishing connection!"
          establish_connection Connectomatic.config_for(db_name)
        end

      end
    end
  end
end
