require "httparty"
require "json"

class ArtistsShowService

  include HTTParty

  attr_accessor :artists

  def initialize
    @artists = JSON.parse(HTTParty.get('http://ws.audioscrobbler.com/2.0/?method=chart.gettopartists&api_key=f08332d7768a1d663d11f766a4c3cd25&format=json').body)
  end


  def get_show_artist(name)
    @artist = JSON.parse(HTTParty.get("http://ws.audioscrobbler.com/2.0/?method=artist.getinfo&artist=#{name}&api_key=f08332d7768a1d663d11f766a4c3cd25&format=json").body)
  end

  def get_show_albums(name)
    @artist = JSON.parse(HTTParty.get("http://ws.audioscrobbler.com/2.0/?method=artist.gettopalbums&artist=#{name}&api_key=f08332d7768a1d663d11f766a4c3cd25&format=json").body)
  end

end
