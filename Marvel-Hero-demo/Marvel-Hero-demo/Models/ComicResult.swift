//
//  ComicResult.swift
//  Marvel-Hero-demo
//
//  Created by Marina Huber on 12/16/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation

// MARK: - ResultStruct
struct ComicResult: Decodable, Hashable {
    let name: String?
    let thumbnail: Thumbnail?
    let identifier = UUID()
    
    enum Keys: String,CodingKey {
        case name = "title"
        case thumbnail
    }
    
    static func == (lhs: ComicResult, rhs: ComicResult) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: Keys.self)
        do {
            self.name = try values.decode(String.self, forKey: .name)
        } catch {
            self.name = nil
        }
        self.thumbnail = try values.decodeIfPresent(Thumbnail.self, forKey: .thumbnail)
    }
}
