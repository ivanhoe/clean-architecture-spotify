
struct GetArtists {
    let repository: Repository
  
    func execute() -> [Artist] {
       return repository.getAll()
    }
}
