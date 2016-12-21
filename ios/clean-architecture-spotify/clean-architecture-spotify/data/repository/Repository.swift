
protocol Repository
{
    func getArtists( name:String, repositoryCallBack: @escaping ([Artist]) -> Void)
    func getTopTracks() -> [Track]
}
