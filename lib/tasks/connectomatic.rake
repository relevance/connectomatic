require 'rake'

namespace :db do

  Rake::Task["db:create:all"].invoke
  load 'active_record/railties/databases.rake'

  def each_local_config
    Dir.glob("config/databases/*.yml") do |filename|
      YAML::load(File.open(filename)).each_value do |config|
        next unless config['database']
        local_database?(config) do
          yield config
        end
      end
    end
  end

  namespace :create do

    desc "Creates all databases defined in databases/*.yml"
    task :everything do
      each_local_config do |config|
        create_database(config)
      end
    end

  end

  namespace :drop do

    desc "Drops all databases defined in databases/*.yml"
    task :everything do
      Rake::Task["db:drop:all"].invoke
      each_local_config do |config|
        begin
          drop_database(config)
        rescue Exception => e
          $stderr.puts "Couldn't drop #{config['database']} : #{e.inspect}"
        end
      end
    end

  end
end
