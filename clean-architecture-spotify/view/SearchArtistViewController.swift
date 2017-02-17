import UIKit

class SearchArtistViewController: UIViewController, ArtistsUI {

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
}

extension SearchArtistViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let artistName: String = searchBar.text!
        print("The search text is: '\(searchBar.text!)'")
        artistPresenter?.searchArtist(query: artistName)
        artistPresenter?.viewDidLoad()

    }
}

extension SearchArtistViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 0
    }

}

extension SearchArtistViewController: UITableViewDelegate {
    func tableView(_: UITableView, cellForRowAt _: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

}
