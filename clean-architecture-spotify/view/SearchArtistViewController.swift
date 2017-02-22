import UIKit

class SearchArtistViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!

    let locator = ServiceLocator()
    var artistPresenter: ArtistPresenter?
    var artistList: [Artist] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupArtistCells()
        artistPresenter = ArtistPresenter(ui: self, getArtists: locator.getArtists)
        searchBar.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setupTableView() {
        tableView.contentInset = UIEdgeInsets(top: 44, left: 0, bottom: 0, right: 0)
        tableView.rowHeight = 80
    }
    func setupArtistCells() {
        let cellNib = UINib(nibName: ArtistCellType.searchResultCell.rawValue, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: ArtistCellType.searchResultCell.rawValue)
    }
}




extension SearchArtistViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        let artistName: String = searchBar.text!
        artistPresenter?.searchArtist(query: artistName)
        artistPresenter?.performSearch()

    }

    func position(for _: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}

extension SearchArtistViewController: ArtistsUI {
    
    func show(items: [Artist]) {
        artistList = items
        tableView.reloadData()
    }
    
    func showLoader() {
        activityIndicatorView.startAnimating()
    }
    
    func hideLoader() {
        activityIndicatorView.stopAnimating()
    }
    
    func showEmptyCase() {
        artistList = []
        tableView.reloadData()
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
}
