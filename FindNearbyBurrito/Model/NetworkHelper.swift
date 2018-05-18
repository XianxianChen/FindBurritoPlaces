//
//  NetworkHelper.swift
//  FindNearbyBurrito
//
//  Created by C4Q on 5/17/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
class NetworkHelper {
    static let manager = NetworkHelper()
    private init() {}
    private let urlSession = URLSession(configuration: .default)
    func performDataTask(urlStr: String, completionHandler: @escaping (Data) -> Void, errorHandler: @escaping (Error) -> Void) {
        guard let url = URL(string: urlStr) else { print("Bad url String")
            return
        }
        urlSession.dataTask(with: url) { (data, urlResponse, error) in
            DispatchQueue.main.async {
           
            if let error = error {
                errorHandler(error)
            }
            if let data = data {
                completionHandler(data)
            }
            }
        }.resume()
        
    }
}

