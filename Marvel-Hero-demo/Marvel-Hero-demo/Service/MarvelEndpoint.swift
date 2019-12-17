//
//  MarvelComicRouter.swift
//  Marvel-Hero-demo
//
//  Created by Marina Huber on 12/17/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation

enum MarvelComicRouter {

   static let scheme = "https"

    // 3.
    static let host = "gateway.marvel.com"


    static let path = "/v1/public/comics"
    
//    static let params: Parameters = [
//        "apikey": dict.publicKey!,
//        "ts": ts,
//        "hash": (ts + dict.privateKey! + dict.publicKey!).md5(),
//        "orderBy": "-focDate",
//        "limit" : limit,
//        "offset" : offset,
//    ]
}
