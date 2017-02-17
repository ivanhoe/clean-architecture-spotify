
struct GetArtists {
    let repository: Repository
  
    func execute(at query: String, completion: @escaping ([Artist]) -> ()) {
      repository.getAll(at: query) { artists in
        completion(artists)
      }
    }
}
