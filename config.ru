require 'sinatra'
require 'sinatra/reloader' if development?
# require_relative './app/models/punk.rb'
require_relative './lib/ArtistAPI.rb'
require_relative './app/controllers/artist_controller.rb'

use Rack::Reloader

use Rack::MethodOverride

run ArtistController
