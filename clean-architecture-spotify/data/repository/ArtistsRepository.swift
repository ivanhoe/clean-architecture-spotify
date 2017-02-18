
import Foundation

struct ArtistsRepository<T: Datasource>: Repository where T.T == ArtistItemEntity {
    
    let datasource: T
    
    func getAll(at query: String, completion: @escaping ([Artist]) -> Void) {
        datasource.getAll(at: query) { artistsItemEntity in
            
            // TODO: transform ArtistsEntityList to Artists            
            var items:[Artist] = []
            for item in artistsItemEntity {
                let value = NewArtist(name:item.name,popularity:String(item.popularity),followers:String(item.followers.total),image:"")
                items.append(value)
            }
            
            completion(items)
        }
    }

    func get(at name: String, completion: @escaping (Artist) -> Void) {
        datasource.get(at: name) { _ in
            // TODO: transform ArtistsEntity to Artist
            // completion(artist)
        }
    }
}


/*
 
 func get(at name: String, completion: @escaping (ArtistEntityItem) -> Void) {
 let artist = self.artists.filter { $0.name == name }.first!
 completion(artist)
 }
 
 func getAll(at query: String, completion: @escaping ([ArtistEntityItem]) -> Void) {
 Alamofire
 .request("https://api.spotify.com/v1/search?type=artist&q=\(query)")
 .responseJSON { response in
 let json = response.result.value as? [String: Any]
 //                print(json)
 // TODO: PARSING JSON to return artists list
 // self.artists = self.getFakeArtistList()
 let result = ArtistEntityResponse(fromDictionary: json!)
 self.artists = result.artists.items
 
 completion(self.artists)
 }
 }
*/
