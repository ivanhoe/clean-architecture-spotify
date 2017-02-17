
import Foundation

struct ArtistsRepository<T: Datasource>: Repository where T.T == ArtistEntity {
    let datasource: T

    func getAll(at query: String, completion _: @escaping ([Artist]) -> Void) {
        datasource.getAll(at: query) { _ in
            // TODO: transform ArtistsEntityList to Artists
            // completion(artists)
        }
    }

    func get(at name: String, completion _: @escaping (Artist) -> Void) {
        datasource.get(at: name) { _ in
            // TODO: transform ArtistsEntity to Artist
            // completion(artist)
        }
    }
}
