
import Alamofire

class AlamofireRestApi: RestApi
{
    func getArtistList(query: String, alamofireCallback: @escaping ([ArtistEntity]) -> Void) {
        Alamofire.request("https://api.spotify.com/v1/search?type=artist&q=\(query)").responseJSON{ response in
            let json = response.result.value as? [String: Any]
            print(json)
            let artistEntity = ArtistEntity(name: "Muse", popularity: "2342346")
            var artistEntityList = [ArtistEntity]()
            artistEntityList.append(artistEntity)
            alamofireCallback(artistEntityList)
        }
    } 
}
