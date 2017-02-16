
class ArtistPresenter {
    let getArtistList:GetArtists
    let artistView:ArtistView
    
    init(artistView:ArtistView, getArtistList:GetArtists) {
        self.artistView = artistView
        self.getArtistList = getArtistList
    }
    
    func search(artistName: String) {
      self.artistView.showArtistsList(artist: getArtistList.execute())
    }
}


protocol ArtistView {
    func showArtistsList(artist:[Artist])
}
