
protocol Datasource {
    associatedtype T
    func getAll() -> [T]
    func get(at name: String) -> T
}
