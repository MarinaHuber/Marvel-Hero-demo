//
//  MarvelAPIClient.swift
//  Marvel-Hero-demo
//
//  Created by Marina Huber on 12/16/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation

/// Implementation of a generic-based Marvel API clienć

struct MarvelAPIClient {

    func request<T: Decodable>(endpoint: MarvelEndpoint ,model: T.Type, completion: @escaping (Result<[T], Error>) -> ()) {
        
       var components = URLComponents()
        components.scheme = endpoint.scheme
        components.host = "gateway.marvel.com:443/v1"
        components.path = "/public/comics"
        components.queryItems = endpoint.queryItems
//            [
//          URLQueryItem(name: "ts", value: "1"),
//          URLQueryItem(name: "apikey", value: "0c2f02f8b9f688f68e2966152baab9ad"),
//          URLQueryItem(name: "hash", value: "19f7270e1108f3edb32bb12e47f48191")
//        ]
        let request = URLRequest(url: components.url!)

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
          if (error != nil) {
            print(APIError.invalidURL)
          } else {
            let httpResponse = response as? HTTPURLResponse
            let decoded = try! JSONDecoder().decode(T.self, from: data!)
            print(httpResponse)
          }
        })

        dataTask.resume()
    }
    
}
