
import Foundation

class CloudDatasource<T>: Datasource {
   // let restApi: RestApi
   // let query: String
  
    /*init(query: String) {
      self.query = query
    }*/
  
    var items: [T] = []
    func getAll() -> [T] { return items }
    func get(at index: Int) -> T { return items[index] }
  
}
