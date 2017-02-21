
import Alamofire


class AlamofireRestApi: RestApi {

    //artistEntityList
    var artists: [ArtistItemEntity] = []

    func getAll(at query: String, completion: @escaping ([ArtistItemEntity]) -> Void) {
        Alamofire
            .request("https://api.spotify.com/v1/search?type=artist&q=\(query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)")
            .responseJSON { response in
                let json = response.result.value as? [String: Any]
                if json != nil {
                    let result = ArtistResponseEntity(fromDictionary: json!)
                    self.artists = result.artists.items
                }
                                
                completion(self.artists)
        }
    }

    func get(at name: String, completion: @escaping (ArtistItemEntity) -> Void) {
        let artist = self.artists.filter { $0.name == name }.first!
        completion(artist)
    }

    func getFakeArtistList() -> [Artist] {
        var fakeArtists: [Artist] = []
        for i in 0 ..< 10 {
            fakeArtists.append(getFakeArtist(index: i))
        }

        return fakeArtists
    }

    func getFakeArtist(index: Int) -> Artist {
        return NewArtist(name: "name\(index)",
                         popularity: "popularity \(index)",
                         followers: "followers\(index)",
                         imageURL: "image\(index)"
        )
    }
}
