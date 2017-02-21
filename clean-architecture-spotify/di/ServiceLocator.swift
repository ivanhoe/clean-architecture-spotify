import Foundation

class ServiceLocator {

    var alamofireRestApi: RestApi {
        return AlamofireRestApi()
    }

    var cloudDataSource: CloudDatasource {
        return CloudDatasource(restApi: alamofireRestApi)
    }

    var artistsRepository: Repository {
        return ArtistsRepository(datasource: cloudDataSource)
    }

    var getArtists: GetArtists {
        return GetArtists(repository: artistsRepository)
    }

}
