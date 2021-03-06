require "httparty"
require "json"

class ArtistController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')
  set :views, Proc.new { File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do

    @api_call = ArtistAPI.new
    @artists = @api_call.artist_index_service
    @artists = @artists.get_all_artists

    erb :'artist/index'

  end

  get '/search/:id' do

    id = params[:id]

    @api_call = ArtistAPI.new
    @artists = @api_call.artist_search_service.get_search(id)
    erb :'artist/search'

  end

  get '/artist/:id' do

    id = params[:id]

    @api_call = ArtistAPI.new
    @artist = @api_call.artist_show_service.get_show_artist(id)
    @albums = @api_call.album_index_service.get_top3_albums(id)
    erb :'artist/show'

  end
  get '/:id' do
    id = params[:id]
    @api_call = ArtistAPI.new
    @artists = @api_call.artist_index_service
    @artists = @artists.get_tag_top(id)["artist"]
    erb :'artist/index'

  end

end
