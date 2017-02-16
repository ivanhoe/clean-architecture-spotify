
import Alamofire

class AlamofireRestApi: RestApi {
    var artists: [Artist] = []
  
    func getAll() -> [Artist] {
       let search = "muse" //TODO delete this hardcoded MUSE
        Alamofire
          .request("https://api.spotify.com/v1/search?type=artist&q=\(search)")
          .responseJSON{ response in
              //let json = response.result.value as? [String: Any] 
              // TODO PARSING JSON to return artists list
            
          }
    self.artists = self.getFakeArtistList()
    return artists
    }
  
   func get(at name: String) -> Artist {
     return self.artists.filter{ $0.name == name }.first!
   }
  
  func getFakeArtistList() -> [Artist]{
     var fakeArtists: [Artist] = []
     for (i, _) in fakeArtists.enumerated() {
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
