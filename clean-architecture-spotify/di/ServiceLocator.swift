//
//  ServiceLocator.swift
//  clean-architecture-spotify
//
//  Created by Erik Jhordan González Reyes on 16/02/17.
//  Copyright © 2017 Iván Álvares Frías. All rights reserved.
//

import Foundation

class ServiceLocator {
  
  var alamofireRestApi: RestApi {
    return AlamofireRestApi()
  }
		
  var cloudDataSource: CloudDatasource {
    return CloudDatasource(restApi: alamofireRestApi)
  }
  
  var artistsRepository: Repository {
    return ArtistsRepository(datasource: cloudDataSource)
  }
  
  var getArtists: GetArtists {
    return GetArtists(repository: artistsRepository)
  }
  
}
