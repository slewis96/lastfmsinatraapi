require "httparty"
require "json"

class ArtistSearchService

  include HTTParty

  attr_accessor :artistsearch

  def get_search(query)
    @artistsearch = JSON.parse(HTTParty.get("http://ws.audioscrobbler.com/2.0/?method=artist.search&artist=#{query.gsub('&','%26')}&limit=10&api_key=f08332d7768a1d663d11f766a4c3cd25&format=json").body)
    @artistsearch["results"]["artistmatches"]["artist"]
  end

end
