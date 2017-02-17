import UIKit

class ViewController: UIViewController, ArtistsUI {

    @IBOutlet weak var searchArtistInput: UITextField!
    @IBOutlet weak var searchArtistButton: UIButton!

    let locator = ServiceLocator()
    var artistPresenter: ArtistPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        artistPresenter = ArtistPresenter(ui: self, getArtists: locator.getArtists)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func show(items: [Artist]) {
        print("value: \(items)")
    }

    func showLoader() {
        // show a Loader
    }

    func hideLoader() {
        // hide a Loader
    }

    func showEmptyCase() {
        // show Empty Case
    }

    @IBAction func onSearchArtist(_: Any) {
        let artistName: String = searchArtistInput.text!
        artistPresenter?.searchArtist(query: artistName)
        artistPresenter?.viewDidLoad()
    }
}
