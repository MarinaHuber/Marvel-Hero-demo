//
//  Thumbnail.swift
//  Marvel-Hero-demo
//
//  Created by Marina Huber on 12/16/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit
import Foundation

struct Thumbnail: Decodable {
    enum ImageKeys: String, CodingKey {
        case path = "path"
        case fileExtension = "extension"
    }
    let url: URL

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ImageKeys.self)

        let path = try container.decode(String.self, forKey: .path)
        let fileExtension = try container.decode(String.self, forKey: .fileExtension)

        guard let url = URL(string: "\(path).\(fileExtension)") else {
            throw DecodingError.typeMismatch(Thumbnail.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Thumbnail"))
        }
            self.url = url
    }
}
