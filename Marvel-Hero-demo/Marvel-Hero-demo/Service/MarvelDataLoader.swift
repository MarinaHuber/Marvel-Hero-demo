//
//  MarvelAPIClient.swift
//  Marvel-Hero-demo
//
//  Created by Marina Huber on 12/16/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation

/// Implementation of a generic-based Marvel API client

struct MarvelDataLoader {
    
    func request<T: Decodable>(endpoint: MarvelEndpoint, model: T.Type, completion: @escaping (Result<[T], Error>) -> ()) {
        
        var components = URLComponents()
        components.scheme = endpoint.scheme
        components.host = endpoint.host
        components.path = endpoint.path
        components.queryItems = endpoint.queryItems
        
        let request = URLRequest(url: components.url!)
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(APIError.invalidURL)
            } else {
                let httpResponse = response as? HTTPURLResponse
                let decoded = try! JSONDecoder().decode(T.self, from: data!)
                print(decoded)
            }
        })
        
        dataTask.resume()
    }
    
}
