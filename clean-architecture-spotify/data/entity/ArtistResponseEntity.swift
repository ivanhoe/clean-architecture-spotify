//
//	ArtistEntityResponse.swift
//
//	Create by Ivan Alvarez on 17/2/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct ArtistResponseEntity{

	var artists : ArtistEntity!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let artistsData = dictionary["artists"] as? [String:Any]{
				artists = ArtistEntity(fromDictionary: artistsData)
			}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if artists != nil{
			dictionary["artists"] = artists.toDictionary()
		}
		return dictionary
	}

}
