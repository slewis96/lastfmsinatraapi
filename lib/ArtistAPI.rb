require_relative "./services/artists_services/artists_show_service"
require_relative "./services/artists_services/artists_index_service"
require_relative "./services/artists_services/album_index_service"
require_relative "./services/artists_services/artist_search_service"

class ArtistAPI

  def artist_show_service
    ArtistsShowService.new
  end

  def artist_index_service
    ArtistsIndexService.new
  end

  def album_index_service
    AlbumIndexService.new
  end

  def artist_search_service
    ArtistSearchService.new
  end

end
