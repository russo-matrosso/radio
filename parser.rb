require_relative 'database.rb'
require 'open-uri'
require 'nokogiri'

songs = DB.from(:songs)
source = 'http://37.58.75.166:8384/currentsong?sid=1'

song = Nokogiri::HTML(open(source)).text
title = song.scan(/\s-\s(.+?)$/).join
artist = song.scan(/^(.+?)\s-/).join

songs.insert(title: title, artist: artist, added: Time.now)