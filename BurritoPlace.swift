//
//  APIKey.swift
//  FindNearbyBurrito
//
//  Created by C4Q on 5/17/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation

//googlePlaceAPIKey = "AIzaSyBZw4iifCIJsmuIUWN6o6tRCXO_dhkKAM0"

struct InfoList: Codable {
    let results: [BurrtoPlace]
}
struct BurritoPlace: Codable {
    let geometry: Geometry
    let name: String
    let priceLevel: Int
    let vicinity: String
    let id: String
    let placeId: String
     // codingKeys
    private enum codingKeys: String, CodingKey {
        case priceLevel = "price_level"
        case placeId = "place_id"
    }
}
struct Geometry: Codable {
    let location: Location
}
struct Location: Codable {
    let lat: Double
    let lng: Double
}

class BurritoPlaceAPIClient {
   
}
