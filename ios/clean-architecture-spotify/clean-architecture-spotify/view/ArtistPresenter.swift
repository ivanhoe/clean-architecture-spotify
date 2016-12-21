
class ArtistPresenter
{
    let getArtistList:GetArtistList
    let artistView:ArtistView
    
    init(artistView:ArtistView, getArtistList:GetArtistList)
    {
        self.artistView = artistView
        self.getArtistList = getArtistList
    }
    
    func search(artistName:String)
    {
        getArtistList.searchArtist(artistQuery: artistName) { (artists) in
            self.artistView.showArtistsList(artist: artists)
        }
    }
}


protocol ArtistView
{
    func showArtistsList(artist:[Artist])
}
