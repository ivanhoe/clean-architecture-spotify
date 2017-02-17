
import Alamofire

class AlamofireRestApi: RestApi {
    var artists: [Artist] = []
  
    func getAll(at query: String, completion: @escaping ([Artist]) -> ()) {
          Alamofire
            .request("https://api.spotify.com/v1/search?type=artist&q=\(query)")
            .responseJSON{ response in
             let json = response.result.value as? [String: Any]
             print(json)
            // TODO PARSING JSON to return artists list
        
             self.artists = self.getFakeArtistList()
        
            completion(self.artists)
        }
    }
  
  
    func get(at name: String, completion: @escaping (Artist) -> ()) {
      let artist = self.artists.filter{ $0.name == name }.first!
      completion(artist)
    }
  
    func getFakeArtistList() -> [Artist]{
      var fakeArtists: [Artist] = []
        for i in 0 ..< 10 {
          fakeArtists.append(getFakeArtist(index: i))
        }
    
      return fakeArtists
    }
  
    func getFakeArtist(index: Int) -> Artist{
      return NewArtist(name: "name\(index)",
        popularity: "popularity \(index)",
        followers: "followers\(index)",
        image: "image\(index)"
      )
    }
}
