//
//  MarvelAPIClient.swift
//  Marvel-Hero-demo
//
//  Created by Marina Huber on 12/16/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation

/// Implementation of a generic-based Marvel API function

struct MarvelDataLoader {
    
    func request<T: Decodable>(_ endpoint: MarvelEndpoint, model: T.Type, completion: @escaping (Result<T, Error>) -> ()) {
        
        var components = URLComponents()
        components.scheme = endpoint.scheme
        components.host = endpoint.host
        components.path = endpoint.path
        components.queryItems = endpoint.queryItems
        
        let request = URLRequest(url: components.url!)
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: request, completionHandler: { data, response, error in
            guard error == nil else {
                completion(.failure(APIError.invalidURL))
                return
            }
            guard let data = data else { return }
            do {
                let httpResponse = response as? HTTPURLResponse
                if httpResponse?.statusCode != 200 {
                    fatalError("statusCode should be 200, but is \(String(describing: httpResponse?.statusCode))")
                }
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let responseObject = try decoder.decode(T.self, from: data)
                
                DispatchQueue.main.async {
                    completion(.success(responseObject))
                }
            } catch let error {
                completion(.failure(error))
            }
        }).resume()
    }

}
