//
//  MarvelComicRouter.swift
//  Marvel-Hero-demo
//
//  Created by Marina Huber on 12/17/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation

/// Extend the enum with more endpoints CRUD / *
// MARK: Endpoint default Marvel.com

enum MarvelEndpoint {
    
     case getComics
     case getComicCover(String)

     var scheme: String {
       switch self {
       case .getComics, .getComicCover(_):
         return "https"
       }
     }
    
    var host: String {
      switch self {
      case .getComics, .getComicCover(_):
        return "gateway.marvel.com"
      }
    }
    
    var path : String {
        switch self {
        case .getComics, .getComicCover(_):
            return "/v1/public/comics"
        }
    }
    
    var queryItems : [URLQueryItem] {
        return [URLQueryItem(name: "ts", value: "1"),
                URLQueryItem(name: "apikey", value: Keys.publicKey),
                URLQueryItem(name: "hash", value: Keys.hashKey)]
    }
}


