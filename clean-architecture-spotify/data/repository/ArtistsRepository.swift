
import Foundation

struct ArtistsRepository<T: Datasource>: Repository where T.T == ArtistEntity {
    let datasource: T
  
    func getAll(at query: String, completion: @escaping ([Artist]) -> ()) {
      datasource.getAll(at: query) { artistEntityList in
          // TODO transform ArtistsEntityList to Artists
          //completion(artists)
      }
    }
  
    func get(at name: String, completion: @escaping (Artist) -> ()) {
      datasource.get(at: name) { artistEntity in
        // TODO transform ArtistsEntity to Artist
        //completion(artist)
      }
    }
  
}
