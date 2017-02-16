
import Alamofire

class AlamofireRestApi<T>: RestApi {
  
  /*func artistEntityList(search: String) -> [ArtistEntity] {
    var artistEntityList = [ArtistEntity]()
    Alamofire.request("https://api.spotify.com/v1/search?type=artist&q=\(search)").responseJSON{ response in
      //let json = response.result.value as? [String: Any]
      //print(json)
      let artistEntity = ArtistEntity(name: "Sample", popularity: "1")
     
      artistEntityList.append(artistEntity)
    }
     return artistEntityList
  }*/
  
  var items: [T] = []
  func getAll() -> [T] {
    let search = "muse"
    Alamofire.request("https://api.spotify.com/v1/search?type=artist&q=\(search)").responseJSON{ response in
      //let json = response.result.value as? [String: Any]
      //print(json)
     // let artistEntity = ArtistEntity(name: "Sample", popularity: "1")
      
      //artistEntityList.append(artistEntity)
    }
    return items
  }
  func get(at index: Int) -> T { return items[index] }
}
