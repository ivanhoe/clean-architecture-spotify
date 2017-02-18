//
//	ArtistEntityItem.swift
//
//	Create by Ivan Alvarez on 17/2/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct ArtistItemEntity {

	var externalUrls : ArtistExternalUrlEntity!
	var followers : ArtistFollowerEntity!
	var genres : [String]!
	var href : String!
	var id : String!
	var images : [ArtistImageEntity]!
	var name : String!
	var popularity : Int!
	var type : String!
	var uri : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let externalUrlsData = dictionary["external_urls"] as? [String:Any]{
				externalUrls = ArtistExternalUrlEntity(fromDictionary: externalUrlsData)
			}
		if let followersData = dictionary["followers"] as? [String:Any]{
				followers = ArtistFollowerEntity(fromDictionary: followersData)
			}
		genres = dictionary["genres"] as? [String]
		href = dictionary["href"] as? String
		id = dictionary["id"] as? String
		images = [ArtistImageEntity]()
		if let imagesArray = dictionary["images"] as? [[String:Any]]{
			for dic in imagesArray{
				let value = ArtistImageEntity(fromDictionary: dic)
				images.append(value)
			}
		}
		name = dictionary["name"] as? String
		popularity = dictionary["popularity"] as? Int
		type = dictionary["type"] as? String
		uri = dictionary["uri"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if externalUrls != nil{
			dictionary["external_urls"] = externalUrls.toDictionary()
		}
		if followers != nil{
			dictionary["followers"] = followers.toDictionary()
		}
		if genres != nil{
			dictionary["genres"] = genres
		}
		if href != nil{
			dictionary["href"] = href
		}
		if id != nil{
			dictionary["id"] = id
		}
		if images != nil{
			var dictionaryElements = [[String:Any]]()
			for imagesElement in images {
				dictionaryElements.append(imagesElement.toDictionary())
			}
			dictionary["images"] = dictionaryElements
		}
		if name != nil{
			dictionary["name"] = name
		}
		if popularity != nil{
			dictionary["popularity"] = popularity
		}
		if type != nil{
			dictionary["type"] = type
		}
		if uri != nil{
			dictionary["uri"] = uri
		}
		return dictionary
	}

}
