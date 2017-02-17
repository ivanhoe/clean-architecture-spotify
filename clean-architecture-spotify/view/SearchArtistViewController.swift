import UIKit

class SearchViewController: UIViewController, ArtistsUI {

    @IBOutlet weak var searchArtistInput: UITextField!
    @IBOutlet weak var searchArtistButton: UIButton!

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

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

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let artistName: String = searchBar.text!
        print("The search text is: '\(searchBar.text!)'")
        artistPresenter?.searchArtist(query: artistName)
        artistPresenter?.viewDidLoad()

    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
