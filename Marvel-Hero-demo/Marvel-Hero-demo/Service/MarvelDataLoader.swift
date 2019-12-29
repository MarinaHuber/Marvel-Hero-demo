//
//  MarvelAPIClient.swift
//  Marvel-Hero-demo
//
//  Created by Marina Huber on 12/16/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation

/// Implementation of a generic-based Marvel API function
// MARK: Build request 

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
                completion(.failure(APIError.invalidRequest))
                return
            }
            guard let data = data else { return }
            do {
                let httpResponse = response as? HTTPURLResponse
                if httpResponse?.statusCode != 200 {
                    assert(false, "statusCode should be 200, but is \(String(describing: httpResponse?.statusCode))")
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
    
        // MARK: Private methods
        
//        private func getFormattedError(responseData: Data?, defaultError: Error?) -> Error {
//            if let data = responseData {
//                if let baseResponse = try? JSONDecoder().decode(status.self, from: data),
//                    let errorString = baseResponse.error {
//                    return HTTPRequestError.custom(errorString)
//                }
//            }
//            return defaultError ?? HTTPRequestError.invalidResponse
//        }
//    }

}

//    extension UrlSessionService {
//        enum HTTPRequestError: Error {
//            case invalidResponseDataType
//            case invalidResponse
//            case custom(String)
//
//            var localizedDescription: String {
//                switch self {
//                case .invalidResponseDataType:
//                    return "Response's data format is different from expected."
//                case .invalidResponse:
//                    return "Invalid response."
//                case .custom(let value):
//                    return value
//                }
//            }
//        }
//    }



