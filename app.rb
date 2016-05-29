require 'sinatra'
require_relative 'database.rb'

configure {
  set :server, :puma
}

class App < Sinatra::Base
  get '/' do
    @songs = DB.from(:songs)
    haml :index
  end

  run! if app_file == $0
end
