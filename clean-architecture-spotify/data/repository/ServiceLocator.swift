
import Foundation

class ServiceLocator {

    lazy var cloudDataSource: CloudDatasource<Artist> = {
        return CloudDatasource<Artist>()
    }()
  
    var artistsRepository: Repository {
      return ArtistsRepository(datasource: cloudDataSource)
    }
  
    var getArtists: GetArtists {
      return GetArtists(repository: artistsRepository)
    }
		
    

}
