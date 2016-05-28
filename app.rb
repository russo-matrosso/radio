require 'sinatra'
require_relative 'database.rb'

class App < Sinatra::Base
  get '/' do
    @songs = DB.from(:songs)
    haml :index
  end
end
