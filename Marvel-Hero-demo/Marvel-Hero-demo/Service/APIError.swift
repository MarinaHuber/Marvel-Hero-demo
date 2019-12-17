//
//  APIError.swift
//  Marvel-Hero-demo
//
//  Created by Marina Huber on 12/16/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation
enum APIError: Error {
    case decoding
    case invalidURL
    case networkFailed
    case invalidJSON
    case server(message: String)
}
