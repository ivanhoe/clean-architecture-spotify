
protocol RestApi {
    func getAll(at query: String, completion: @escaping ([ArtistEntity]) -> Void)
    func get(at name: String, completion: @escaping (ArtistEntity) -> Void)
}
