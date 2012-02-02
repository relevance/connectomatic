# connectomatic

This gem provides a simple way of managing multiple activerecord connections.

Currently it only works with Rails 3.0.11.

### Config structure

In addition to a rails project's primary database defined in `config/database.yml`, connectomatic allows you to define additional databases by placing any number of `<database_name>.yml` files in a `config/databases/` directory. Each database config file uses the same format as a normal database.yml file.

### Rake tasks

`rake db:create:everything` creates all the defined databases.
`rake db:drop:everything` drops all the defined databases.

TODO: Schema dump and schema load for additional databases.

### Using the databases

#### ActiveRecord Models

Just invoke the `connectomatic` method and pass it the name of the database you'd like it to use in your model object.

````ruby
class MyModel < ActiveRecord::Base
      connectomatic(:my_database)
end

````

#### Migrations

To run a migration on an alternate database, just invoke the `self.connectomatic` method in your migration class and pass it the name of the database you'd like it to use.

````ruby
class CreateSomething < ActiveRecord::Migration
      
      self.connectomatic(:my_database)
      
      def self.up 
          #
      end

      def self.down
          #
      end
end
````
## Credits

Inspiration for this gem (and several of the techniques used) were provided by Chris Herring's connection_ninja gem. (https://github.com/cherring/connection_ninja)