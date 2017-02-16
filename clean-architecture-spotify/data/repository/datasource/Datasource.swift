
protocol Datasource
{
    func getArtistEntityList(queryDS:String,dataSourceCallback: @escaping ([ArtistEntity]) -> Void)
}
