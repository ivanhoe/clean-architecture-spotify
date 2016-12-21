import UIKit

class ViewController: UIViewController,ArtistView {

    var artistPresenter:ArtistPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        artistPresenter = ArtistPresenter(artistView:self, getArtistList:GetArtistList(repository:SpotifyRepository(dataSourceFactory: DataSourceFactory())))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        artistPresenter?.search(artistName:"")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    func showArtistsList(artist: [Artist]) {
    
            print(artist[0].name)
        
    }

}

