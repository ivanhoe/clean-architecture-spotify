
import Alamofire

class AlamofireRestApi: RestApi
{
    func getArtistList(query: String, alamofireCallback: @escaping ([ArtistEntity]) -> Void) {
        Alamofire.request("https://api.spotify.com/v1/search?type=artist&q=arctic").response{ response in
            print(response)
            let artistEntity = ArtistEntity(name: "Muse", popularity: "2342346")
            var artistEntityList = [ArtistEntity]()
            artistEntityList.append(artistEntity)
            alamofireCallback(artistEntityList)
        }
    } 
}
