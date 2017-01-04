 
 
 class SpotifyRepository:Repository
 {
    let dataSourceFactory:DataSourceFactory
    
    init(dataSourceFactory:DataSourceFactory) {
        self.dataSourceFactory = dataSourceFactory
    }
    
    func getArtists( name:String, repositoryCallBack: @escaping ([Artist]) -> Void)
    {
            dataSourceFactory.create().getArtistEntityList(queryDS: name) { (artists) in
            
            let artist = Artist(name: artists[0].name + "Mappeado", popularity: artists[0].popularity + "Mappeado", followers: "", image: "")
            
            var artists:[Artist] = [Artist]()
            artists.append(artist)
            repositoryCallBack(artists)
        }
        
        
    }
  
    func getTopTracks() -> [Track]
    {
        let tracks:[Track] = [Track]()
        return tracks;
    }
    
 }
