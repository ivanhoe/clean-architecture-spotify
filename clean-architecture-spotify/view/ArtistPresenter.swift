
class ArtistPresenter: Presenter {
    let ui: ArtistsUI
    let getArtists: GetArtists
    var query: String!
  
    init(ui: ArtistsUI, getArtists: GetArtists) {
        self.ui = ui
        self.getArtists = getArtists
    }
  
    func viewDidLoad() {
      self.ui.showLoader()
      getArtists.execute(at: self.query) { artists in
        self.ui.hideLoader()
        if artists.isEmpty{
          self.ui.showEmptyCase()
        }else{
          self.ui.show(items: artists)
        }
      }
    }
  
    func searchArtist(query: String) {
      self.query = query
    }
  
}


protocol ArtistsUI: BaseUI {
    func show(items:[Artist])
    func showLoader()
    func hideLoader()
    func showEmptyCase()
}
