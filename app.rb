require 'sinatra'
require_relative 'database.rb'
require 'sinatra/twitter-bootstrap'

configure {
  set :server, :puma
}

class App < Sinatra::Base
  register Sinatra::Twitter::Bootstrap::Assets
  
  get '/' do
    @songs = DB.from(:songs)
    haml :index
  end

  run! if app_file == $0
end
