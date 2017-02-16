
protocol Datasource {
    associatedtype T
    func getAll() -> [T]
    func get(at index: Int) -> T
}
