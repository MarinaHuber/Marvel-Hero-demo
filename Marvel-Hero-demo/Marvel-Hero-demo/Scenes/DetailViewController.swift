//
//  DetailViewController.swift
//  Marvel-Hero-demo
//
//  Created by Marina Huber on 12/17/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit
import AlamofireImage

final class DetailViewController: UIViewController, StoryboardProtocol {
    
    @IBOutlet weak var imageComicCover: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MarvelDataLoader().request(.getComics, model: ComicObjectData.self) { result in
            switch result {
            case .success:
                _ = result.map {
                    $0.data?.results.map {
                        if let imageURL = $0.thumbnail?.url {
                            self.imageComicCover.af_setImage(withURL: imageURL)
                        }
                    }
                }
            case .failure:
                print("some error: \(APIError.networkFailed)")
            }
        }
    }
}
