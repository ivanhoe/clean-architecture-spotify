//
//	ArtistEntityFollower.swift
//
//	Create by Ivan Alvarez on 17/2/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct ArtistFollowerEntity{

	var href : AnyObject!
	var total : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		href = dictionary["href"] as? AnyObject
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
		if total != nil{
			dictionary["total"] = total
		}
		return dictionary
	}

}
