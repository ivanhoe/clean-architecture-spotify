 
 
 class SpotifyRepository:Repository
 {
    func getArtistList( name:String, repositoryCallBack:([Artist]) -> Void)
    {
        var artists:[Artist] = [Artist]()
        let artist:Artist = Artist(name: "Muse",
                                   popularity: "10",
                                   followers: "10",
                                   image: "http://")
        for _ in 0...10 {
            artists.append(artist)
        }
                
        repositoryCallBack(artists)
    }
  
    func getTopTracks() -> [Track]
    {
        let tracks:[Track] = [Track]()
        return tracks;
    }
    
 }
