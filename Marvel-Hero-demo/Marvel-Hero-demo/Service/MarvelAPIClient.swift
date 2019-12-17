//
//  MarvelAPIClient.swift
//  Marvel-Hero-demo
//
//  Created by Marina Huber on 12/16/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation

/// Implementation of a generic-based Marvel API client

class MarvelAPIClient {

    
    
    internal func fetch<T: Codable>(listOf codable: T.Type,
                         withURL url: URL?,
                         completionHandler: @escaping (Result<[T], APIError>) -> Void) {
        
    }
}
