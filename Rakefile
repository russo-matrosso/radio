require_relative 'database.rb'
require_relative 'parser.rb'

task :default => :greet

desc 'Parse current song on RWCS'
task :parse do
  song = Song.new
  song.parse_source('http://37.58.75.166:8384/currentsong?sid=1')
  song.add_to_database
end

desc 'Update your cronfile, see "config/schedule.rb" for config'
task :update_cron do
  `whenever -w`
end

namespace :db do
  desc 'Create database'
  task :create do
    `sqlite3 db/radio.db "create table radio(field1 int); drop table radio;"`
  end

  desc 'Migrate database'
  task :migrate do
    Database.run_migrations
  end
end

desc 'Run console'
task :console do
  system 'pry -r ./app.rb'
end

task :greet do
  puts 'RadioWCS parser, for all tasks print "rake -T"'
end