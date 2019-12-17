//
//  Comic.swift
//  Marvel-Hero-demo
//
//  Created by Marina Huber on 12/16/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation

struct ComicResult: Decodable, Hashable {

    enum Keys: String,CodingKey {
        case name = "title"
        case thumbnail
    }
    
    let name: String?
    let thumbnail: Thumbnail?
    let identifier = UUID()

    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }

    static func ==(lhs: ComicResult, rhs: ComicResult) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: Keys.self)
        self.name = try values.decode(String.self, forKey: .name)
        self.thumbnail = try values.decodeIfPresent(Thumbnail.self, forKey: .thumbnail)
    }
}
