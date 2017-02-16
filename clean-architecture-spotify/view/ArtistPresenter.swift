
class ArtistPresenter {
    let getArtistList:GetArtists
    let artistView:ArtistView
    
    init(artistView:ArtistView, getArtistList:GetArtists) {
        self.artistView = artistView
        self.getArtistList = getArtistList
    }
    
    func search(artistName: String) {
      let artists = getArtistList.execute()
      self.artistView.showArtistsList(artist: artists)
    }
}


protocol ArtistView {
    func showArtistsList(artist:[Artist])
}
