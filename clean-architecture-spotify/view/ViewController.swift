import UIKit

class ViewController: UIViewController,ArtistView {

    @IBOutlet weak var searchArtistInput : UITextField!
    @IBOutlet weak var searchArtistButton : UIButton!
  
    let locator = ServiceLocator()
    var artistPresenter:ArtistPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        artistPresenter = ArtistPresenter(artistView:self, getArtistList: locator.getArtists)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    func showArtistsList(artist: [Artist]) {
    
            print(artist)
        
    }
    
 

    @IBAction func onSearchArtist(_ sender: Any) {
        
        let artistQuery:String = searchArtistInput.text!
        artistPresenter?.search(artistName: artistQuery)
    }
}

