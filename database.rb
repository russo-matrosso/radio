require 'sequel'
Sequel.extension :migration

DB = Sequel.connect('sqlite://db/radio.db') # Connection to the database

class Database
  def self.run_migrations
    Sequel::Migrator.run(DB, 'db/migrations/')
  end

  def self.test
    puts 'hi'
  end
end
