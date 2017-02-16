
import Foundation

struct ArtistsRepository<T: Datasource>: Repository where T.T == Artist{
    let datasource: T
  
    func getAll() -> [Artist] { return datasource.getAll() }
    func get(at name: String) -> Artist { return datasource.get(at: name) }
  
}
