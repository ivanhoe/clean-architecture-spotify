//
//	ArtistEntityArtist.swift
//
//	Create by Ivan Alvarez on 17/2/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct ArtistEntity{

	var href : String!
	var items : [ArtistItemEntity]!
	var limit : Int!
	var next : AnyObject!
	var offset : Int!
	var previous : AnyObject!
	var total : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		href = dictionary["href"] as? String
		items = [ArtistItemEntity]()
		if let itemsArray = dictionary["items"] as? [[String:Any]]{
			for dic in itemsArray{
				let value = ArtistItemEntity(fromDictionary: dic)
				items.append(value)
			}
		}
		limit = dictionary["limit"] as? Int
		next = dictionary["next"] as? AnyObject
		offset = dictionary["offset"] as? Int
		previous = dictionary["previous"] as? AnyObject
		total = dictionary["total"] as? Int
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if href != nil{
			dictionary["href"] = href
		}
		if items != nil{
			var dictionaryElements = [[String:Any]]()
			for itemsElement in items {
				dictionaryElements.append(itemsElement.toDictionary())
			}
			dictionary["items"] = dictionaryElements
		}
		if limit != nil{
			dictionary["limit"] = limit
		}
		if next != nil{
			dictionary["next"] = next
		}
		if offset != nil{
			dictionary["offset"] = offset
		}
		if previous != nil{
			dictionary["previous"] = previous
		}
		if total != nil{
			dictionary["total"] = total
		}
		return dictionary
	}

}
