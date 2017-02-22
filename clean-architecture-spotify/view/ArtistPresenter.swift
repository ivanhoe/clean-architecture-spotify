
class ArtistPresenter: Presenter {
    weak var ui: ArtistsUI?
    let getArtists: GetArtists
    var query: String!

    init(ui: ArtistsUI, getArtists: GetArtists) {
        self.ui = ui
        self.getArtists = getArtists
    }
    
    func performSearch() {
        self.ui?.showLoader()
        
        getArtists.execute(at: self.query) { artists in
            self.ui?.hideLoader()
            if artists.isEmpty {
                self.ui?.showEmptyCase()
            } else {
                self.ui?.show(items: artists)
            }
        }
    }

    func searchArtist(query: String) {
        self.query = query
    }
}

protocol ArtistsUI: class, BaseUI {
    func show(items: [Artist])
    func showLoader()
    func hideLoader()
    func showEmptyCase()
}
