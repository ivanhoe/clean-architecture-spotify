
class DataSourceFactory
{
    func create() -> Datasource{
        var datasource:Datasource
        datasource = createCloudDataSource()
        return datasource
    }
    
    func createCloudDataSource() -> Datasource {
        let alamofireRestApi = AlamofireRestApi()
        return CloudDatasource(restApi: alamofireRestApi)
    }
}
