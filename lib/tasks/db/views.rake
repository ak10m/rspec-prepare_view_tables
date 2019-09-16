# frozen_string_literal: true

namespace :db do
  desc "create view tables"
  task views: :environment do
    dir = Rails.root.join("db", "views")
    puts "== create or replace view tables from #{dir}/{view_name}.sql"
    Dir.glob(dir.join("*")).each do |path|
      view_name = File.basename(path, ".sql")
      puts "-- `#{view_name}`"
      File.open(path) do |file|
        ActiveRecord::Base.connection.execute("CREATE OR REPLACE VIEW #{view_name} AS #{file.read};")
      end
    end
  end
end

# hook after tasks
Rake::Task["db:migrate"].enhance do
  Rake::Task["db:views"].invoke
end

Rake::Task["db:test:prepare"].enhance do
  Rake::Task["db:views"].invoke
end
