
protocol Datasource {
    associatedtype T
    func getAll(at query: String, completion: @escaping ([T]) -> ())
    func get(at name: String, completion: @escaping (T) -> ())
}
