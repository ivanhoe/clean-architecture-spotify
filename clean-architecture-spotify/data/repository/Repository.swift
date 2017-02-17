
protocol Repository {
    func getAll(at query: String, completion: @escaping ([Artist]) -> Void)
    func get(at name: String, completion: @escaping (Artist) -> Void)
}
