//
//  ComicData.swift
//  Marvel-Hero-demo
//
//  Created by Marina Huber on 12/18/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation

// MARK: - DataStruct
struct ComicData: Decodable {
    
//    enum Keys: String,CodingKey {
//        case comics = "results"
//    }
    let results: [ComicResult]
    

}
