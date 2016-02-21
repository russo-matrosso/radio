require_relative 'database.rb'
require_relative 'parser.rb'

task :parse do
  song = Song.new
  song.parse_source('http://37.58.75.166:8384/currentsong?sid=1')
  song.add_to_database
end

task :migrate do
  Database.run_migrations
end
