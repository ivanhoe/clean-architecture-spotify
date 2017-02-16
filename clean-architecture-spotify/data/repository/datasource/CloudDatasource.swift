
import Foundation

class CloudDatasource: Datasource {
  
    let restApi: RestApi
  
    init(restApi: RestApi) {
      self.restApi = restApi
    }
  
    func getAll() -> [Artist] { return restApi.getAll() }
  
    func get(at name: String) -> Artist { return restApi.get(at: name)}
  
}
