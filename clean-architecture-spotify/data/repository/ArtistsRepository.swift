
import Foundation

struct ArtistsRepository<T: Datasource>: Repository where T.T == ArtistItemEntity {
    
    let datasource: T
    let defaultImage: String = "http://bit.ly/swiftDefaultLogo"
    
    func getAll(at query: String, completion: @escaping ([Artist]) -> Void) {
        
        datasource.getAll(at: query) { entities in
            
            var artists: [Artist] = []
            for entity in entities {
                artists.append(self.createArtist(entity: entity))
            }
            
            completion(artists)
        }
    }
    
    func get(at name: String, completion _: @escaping (Artist) -> Void) {
        datasource.get(at: name) { _ in
            // TODO: transform ArtistsEntity to Artist
            // completion(artist)
        }
    }
    
    func createArtist(entity: ArtistItemEntity) -> Artist {
        
        var artist: NewArtist = NewArtist(name: "", popularity: "", followers: "", imageURL: "")
        
        if entity.images.isEmpty {
            artist = NewArtist(name: entity.name,
                               popularity: String(entity.popularity),
                               followers: String(entity.followers.total),
                               imageURL: self.defaultImage)
        } else {
            let image = entity.images[0]
            artist = NewArtist(name: entity.name,
                               popularity: String(entity.popularity),
                               followers: String(entity.followers.total),
                               imageURL: image.url)
        }
        
        return artist
    }
    
}
