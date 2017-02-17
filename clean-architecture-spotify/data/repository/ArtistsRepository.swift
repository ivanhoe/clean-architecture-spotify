
import Foundation

struct ArtistsRepository<T: Datasource>: Repository where T.T == Artist {
    let datasource: T
  
    func getAll(at query: String, completion: @escaping ([Artist]) -> ()) {
      datasource.getAll(at: query) { artists in
          completion(artists)
      }
    }
  
    func get(at name: String, completion: @escaping (Artist) -> ()) {
      datasource.get(at: name) { artist in
        completion(artist)
      }
    }
  
}
