//
//  MarvelComicRouter.swift
//  Marvel-Hero-demo
//
//  Created by Marina Huber on 12/17/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation

/// Extend the enum with more endpoints CRUD / *
enum MarvelEndpoint {
    
     case getComics

     var scheme: String {
       switch self {
       case .getComics:
         return "https"
       }
     }
    
    var host: String {
      switch self {
      case .getComics:
        return "gateway.marvel.com"
      }
    }
    
    var path : String {
        switch self {
        case .getComics:
            return "/v1/public/comics"
        }
    }
    
    var queryItems : [URLQueryItem] {
        return [URLQueryItem(name: "ts", value: "1"),
                URLQueryItem(name: "apikey", value: Keys.publicKey),
        URLQueryItem(name: "hash", value: "19f7270e1108f3edb32bb12e47f48191")]
    }
}


