
protocol RestApi {
    func getAll(at query: String, completion: @escaping ([ArtistItemEntity]) -> Void)
    func get(at name: String, completion: @escaping (ArtistItemEntity) -> Void)
}
