
public class GetArtistList
{
    let repository:Repository
    
    init(repository:Repository)
    {
        self.repository = repository
    }
    
    func searchArtist(artistQuery:String, getArtistListCallBack:([Artist]) -> Void)
    {
        self.repository.getArtistList(name:"") { (artists) in
            getArtistListCallBack(artists)
        }
    }
    
    
}
