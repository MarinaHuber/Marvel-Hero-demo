//
//  SimpleImageLoader.swift
//  Marvel-Hero-demo
//
//  Created by Marina Huber on 12/24/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation
import UIKit

protocol ImageLoader {
    func loadImageFrom(urlString: String, completion: @escaping (UIImage?) -> Void)
}

/// Responsible for retrieving UIImage via url using `Data.contentsOfUrl` method.
///
/// __DISCLAIMER__: This class was created just for demo purpose, where we need single loading at a time. It does not provide neither smart multi-loading nor caching.
///
/// Please use another services like AlamofireImage solution etc. for such purposes.

class SimpleImageLoader: ImageLoader {
    func loadImageFrom(urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        DispatchQueue.global(qos: .background).async {
            let data = try? Data(contentsOf: url)
            DispatchQueue.main.async {
                if let data = data {
                    completion(UIImage(data: data))
                } else {
                    completion(nil)
                }
            }
        }
    }
}
<<<<<<< HEAD
=======

>>>>>>> 1e90167b82d2aeadec29d50cbba0b4088c1d2414
