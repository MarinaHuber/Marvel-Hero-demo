//
//  Constants.swift
//  Marvel-Hero-demo
//
//  Created by Marina Huber on 12/16/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation
struct Keys {
    static let privateKey: String = "PRIVATE_KEY"
    static let publicKey: String = "PUBLIC_KEY"
}

struct Servies {
    static let base: String = "https://gateway.marvel.com/v1/public/"
}

struct ServiceParameters {
    static let apiKey: String = "apikey"
    static let hash: String = "hash"
    static let timestamp: String = "ts"
    static let offset: String = "offset"
}
