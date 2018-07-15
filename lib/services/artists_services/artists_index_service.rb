require "httparty"
require "json"

class ArtistsIndexService

  include HTTParty

  attr_accessor :artists

  def initialize
    @artists = JSON.parse(HTTParty.get('http://ws.audioscrobbler.com/2.0/?method=chart.gettopartists&limit=25&api_key=f08332d7768a1d663d11f766a4c3cd25&format=json').body)
  end

  def get_all_artists
    @artists["artists"]["artist"]
  end

  def get_tag_top tag
    @artists = JSON.parse(HTTParty.get("http://ws.audioscrobbler.com/2.0/?method=tag.gettopartists&limit=25&tag=#{tag}&api_key=f08332d7768a1d663d11f766a4c3cd25&format=json").body)
    @artists["topartists"]
  end

end
