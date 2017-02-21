import UIKit

class SearchResultCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var artistImageView: UIImageView!
    @IBOutlet weak var popularityLabel: UILabel!
    
    var downloadTask: URLSessionDownloadTask?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(for artist: Artist) {
        
        if artist.name.isEmpty {
            nameLabel.text = "Unknown Artist Name"
        } else {
            nameLabel.text = artist.name.capitalized
        }
        
        if artist.followers.isEmpty {
            followersLabel.text = "Unknown"
        } else {
            followersLabel.text = "Followers: \(artist.followers)"
        }
        
        if artist.popularity.isEmpty {
            popularityLabel.text = "Unknown"
        } else {
            popularityLabel.text = "Popularity: \(artist.popularity)"
        }
        
        artistImageView.image = UIImage(named: "Placeholder")
        if let thumbnailURL = URL(string: artist.imageURL) {
            downloadTask = artistImageView.loadImage(url: thumbnailURL)
        }
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        downloadTask?.cancel()
        downloadTask = nil
    }
}
