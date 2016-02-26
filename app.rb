require 'sinatra'
require_relative 'database.rb'

get '/' do
  @songs = DB.from(:songs)
  haml :index
end