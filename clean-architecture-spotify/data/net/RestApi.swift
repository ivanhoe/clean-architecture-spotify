
protocol RestApi {
    func getAll() -> [Artist]
    func get(at name: String) -> Artist
}
