require "httparty"
require "json"

class AlbumIndexService

  include HTTParty

  attr_accessor :albums

  def get_show_albums(name)
    @albums = JSON.parse(HTTParty.get("http://ws.audioscrobbler.com/2.0/?method=artist.gettopalbums&artist=#{name.downcase.gsub(' ','%20').gsub('&','%26')}&api_key=f08332d7768a1d663d11f766a4c3cd25&format=json").body)
  end
  def get_top3_albums(name)
    @albums = JSON.parse(HTTParty.get("http://ws.audioscrobbler.com/2.0/?method=artist.gettopalbums&artist=#{name.downcase.gsub(' ','%20').gsub('&','%26')}&api_key=f08332d7768a1d663d11f766a4c3cd25&format=json").body)
    @albums["topalbums"]["album"].first(3)
  end

end
