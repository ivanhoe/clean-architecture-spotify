
protocol RestApi
{
    func getArtistList(query:String,alamofireCallback: @escaping ([ArtistEntity]) -> Void)
}
