
protocol Repository {
    func getAll() -> [Artist]
    func get(at index: Int) -> Artist
}
