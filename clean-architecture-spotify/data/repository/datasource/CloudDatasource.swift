
import Foundation

class CloudDatasource:Datasource
{
    let restApi: RestApi
    
    init(restApi:RestApi) {
        self.restApi = restApi
    }
    
    func getArtistEntityList(queryDS: String, dataSourceCallback: @escaping ([ArtistEntity]) -> Void) {
        restApi.getArtistList(query: queryDS) { (artistEntities) in
           
            debugPrint(artistEntities[0].name)
            
            dataSourceCallback(artistEntities)
            
        }
    }
}
