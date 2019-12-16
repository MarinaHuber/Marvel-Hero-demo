//
//  Thumbnail.swift
//  Marvel-Hero-demo
//
//  Created by Marina Huber on 12/16/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

struct Thumbnail: Decodable {

private enum Keys: String, CodingKey {
    case path = "path"
    case fileExtension = "extension"
}

let url: URL?
var image: UIImage = #imageLiteral(resourceName: "Nil")

init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: Keys.self)
    let path = try values.decode(String.self, forKey: .path)
    let fileExtension = try values.decode(String.self, forKey: .fileExtension)
    self.url = URL(string: "\(path).\(fileExtension)")
  }
}
