
public class GetArtistList
{
    let repository:Repository
    
    init(repository:Repository)
    {
        self.repository = repository
    }
    
    func searchArtist(artistQuery:String, getArtistListCallBack: @escaping ([Artist]) -> Void)
    {
        self.repository.getArtists(name:"") { (artists) in
            getArtistListCallBack(artists)
        }
    }
    
    
}
