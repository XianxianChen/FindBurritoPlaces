//
//  APIKey.swift
//  FindNearbyBurrito
//
//  Created by C4Q on 5/17/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation

struct InfoList: Codable {
    let results: [BurritoPlace]
}
struct BurritoPlace: Codable {
    let geometry: Geometry
    let name: String
    let priceLevel: Int?
    let vicinity: String
    let id: String
    let placeId: String?
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
    static let manager = BurritoPlaceAPIClient()
    private init() {}
    private var apiKey = "AIzaSyBZw4iifCIJsmuIUWN6o6tRCXO_dhkKAM0"
    func getBurritoPlaces(lat: Double, lng: Double, completionHandler: @escaping ([BurritoPlace]) -> Void, errorHandler: @escaping (Error) -> Void) {
        
    let urlStr = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(lat),\(lng)&radius=1500&type=restaurant&keyword=burrito&key=\(apiKey)"
        let completion: (Data) -> Void = {(data: Data) in
            do {
            let onlineInfo = try JSONDecoder().decode(InfoList.self, from: data)
            let places = onlineInfo.results
            completionHandler(places)
            } catch {
              print(error)
            }
            
        }
        NetworkHelper.manager.performDataTask(urlStr: urlStr, completionHandler: completion, errorHandler: errorHandler)
    }
}

