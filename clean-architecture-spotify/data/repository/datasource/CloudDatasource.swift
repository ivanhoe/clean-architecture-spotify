
import Foundation

class CloudDatasource: Datasource {
  
    let restApi: RestApi
  
    init(restApi: RestApi) {
      self.restApi = restApi
    }
  
    func getAll(at query: String, completion: @escaping ([Artist]) -> ()) {
      restApi.getAll(at: query) { artists in
        completion(artists)
      }
    }
  
  
    func get(at name: String, completion: @escaping (Artist) -> ()) {
      restApi.get(at: name) { artist in
        completion(artist)
      }
    }
  
}
