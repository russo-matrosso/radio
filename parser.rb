require_relative 'database.rb'
require 'open-uri'
require 'nokogiri'

class Song
  attr_accessor :title, :artist


  def parse_source(source)
      source_string = Nokogiri::HTML(open(source)).text
      self.title = source_string.scan(/\s-\s(.+?)$/).join
      self.artist = source_string.scan(/^(.+?)\s-/).join
  end

  def add_to_database
    return if self.exists_in_database?
    songs = DB.from(:songs)

    songs.insert(title: self.title,
                 artist: self.artist,
                 added: Time.now)
    puts "Song added, title: #{self.title}, artist: #{self.artist}"
  end

  def exists_in_database?
    songs = DB.from(:songs)

    return !songs.where(title: self.title, artist: self.artist).empty?
  end
end

# source = 'http://37.58.75.166:8384/currentsong?sid=1'
# song = Song.new
# song.parse_source(source)
# song.add_song
#
# puts song.inspect
#
