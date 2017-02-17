
struct GetArtists {
    let repository: Repository

    func execute(at query: String, completion: @escaping ([Artist]) -> Void) {
        repository.getAll(at: query) { artists in
            completion(artists)
        }
    }
}
