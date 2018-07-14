require "httparty"
require "json"

class ArtistsIndexService

  include HTTParty

  attr_accessor :artists

  def initialize
    @artists = JSON.parse(HTTParty.get('http://ws.audioscrobbler.com/2.0/?method=chart.gettopartists&limit=20&api_key=f08332d7768a1d663d11f766a4c3cd25&format=json').body)
  end

  def get_all_artists
    @artists["artists"]["artist"]
  end


end
