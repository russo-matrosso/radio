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

    songs.insert(title: title,
                 artist: artist,
                 added: Time.now)
    puts "Song added, title: #{title}, artist: #{artist}"
  end

  def exists_in_database?
    songs = DB.from(:songs)

    !songs.where(title: title, artist: artist).empty?
  end
end
