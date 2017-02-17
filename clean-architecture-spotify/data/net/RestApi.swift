
protocol RestApi {
  func getAll(at query: String, completion: @escaping ([ArtistEntity]) -> ())
  func get(at name: String, completion: @escaping (ArtistEntity) -> ())
}
