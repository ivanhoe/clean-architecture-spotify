import UIKit

class SearchArtistViewController: UIViewController, ArtistsUI {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!

    let locator = ServiceLocator()
    var artistPresenter: ArtistPresenter?
    var artistList: [Artist] = []

    override func viewDidLoad() {
        super.viewDidLoad()
//        activityIndicatorView.isHidden = true
        setupTableView()
        setupArtistCells()
        artistPresenter = ArtistPresenter(ui: self, getArtists: locator.getArtists)
        searchBar.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func show(items: [Artist]) {
        artistList = items
        tableView.reloadData()
    }

    func showLoader() {
        // show a Loader
        activityIndicatorView.startAnimating()
    }

    func hideLoader() {
        // hide a Loader
        activityIndicatorView.stopAnimating()
    }

    func showEmptyCase() {
        artistList = []
        tableView.reloadData()
    }

    func setupTableView() {
        tableView.contentInset = UIEdgeInsets(top: 44, left: 0, bottom: 0, right: 0)
        tableView.rowHeight = 80
    }
    func setupArtistCells() {

        var cellNib = UINib(nibName: ArtistCellType.searchResultCell.rawValue, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: ArtistCellType.searchResultCell.rawValue)

        cellNib = UINib(nibName: ArtistCellType.nothingFoundCell.rawValue, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: ArtistCellType.nothingFoundCell.rawValue)

        cellNib = UINib(nibName: ArtistCellType.loadingCell.rawValue, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: ArtistCellType.loadingCell.rawValue)

    }
}

extension SearchArtistViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        let artistName: String = searchBar.text!
        print("The search text is: '\(searchBar.text!)'")
        artistPresenter?.searchArtist(query: artistName)
        artistPresenter?.viewDidLoad()

    }

    func position(for _: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}

extension SearchArtistViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return artistList.count
    }

    func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: ArtistCellType.searchResultCell.rawValue,
                                                 for: indexPath) as! SearchResultCell
        let artist = artistList[indexPath.row]
        cell.configure(for: artist)

        return cell
    }

}

extension SearchArtistViewController: UITableViewDelegate {

}

enum ArtistCellType: String {

    case searchResultCell = "SearchResultCell"
    case nothingFoundCell = "NothingFoundCell"
    case loadingCell = "LoadingCell"

}
