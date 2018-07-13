require_relative "./services/artists_services/artists_show_service"
require_relative "./services/artists_services/artists_index_service"

class ArtistAPI

  def artist_show_service
    ArtistsShowService.new
  end

  def artist_index_service
    ArtistsIndexService.new
  end

end
