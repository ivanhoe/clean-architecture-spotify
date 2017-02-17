
protocol Repository {
    func getAll(at query: String, completion: @escaping ([Artist]) -> ())
    func get(at name: String, completion: @escaping (Artist) -> ())
}
