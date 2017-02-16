
protocol Repository {
    func getAll() -> [Artist]
    func get(at name: String) -> Artist
}
