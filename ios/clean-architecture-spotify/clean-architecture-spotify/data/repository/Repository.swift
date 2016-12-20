
protocol Repository
{
    func getArtistList( name:String, repositoryCallBack:([Artist]) -> Void)
    func getTopTracks() -> [Track]
}
