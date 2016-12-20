import UIKit

class ViewController: UIViewController,ArtistView {

    var artistPresenter:ArtistPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        artistPresenter = ArtistPresenter(artistView:self, getArtistList:GetArtistList(repository:SpotifyRepository()))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        artistPresenter?.search(artistName:"")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showArtistsList(artist: [Artist]) {
        for index in 0...10{
            print(artist[index].name)
        }
    }

}

