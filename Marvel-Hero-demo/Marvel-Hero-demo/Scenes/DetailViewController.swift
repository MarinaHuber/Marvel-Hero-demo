//
//  DetailViewController.swift
//  Marvel-Hero-demo
//
//  Created by Marina Huber on 12/17/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit
import AlamofireImage

final class DetailViewController: UIViewController, StoryboardProtocol, Alertable {
    
        // MARK: - Properties
    @IBOutlet weak var activityImage: UIActivityIndicatorView!
    @IBOutlet weak var imageComicCover: UIImageView!
    var selectedName: String = ""    
    
        // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        activityImage?.startAnimating()
        loadSelectedName(newName: selectedName)
        imageComicCover.clipsToBounds = true
    }
        // MARK: - Network load
      /// TO DO: refactor this expensive func
    private func loadSelectedName(newName: String) {
        ///af_setImage will automatically find and load the image if it is cached
 //       if newName.isEmpty == false {
            MarvelDataLoader().request(.getComics, model: ComicObjectData.self) { result in
                switch result {
                case .success:
                    _ = result.map {
                        $0.data?.results.map {
                            if newName == $0.name {
                                if let imageURL = $0.thumbnail?.url {
                                    print("image url: \($0.thumbnail?.url)")
                                    self.imageComicCover?.af_setImage(withURL: imageURL,
                                                                      placeholderImage: nil,
                                                                      imageTransition: UIImageView.ImageTransition.crossDissolve(0.2),
                                                                      runImageTransitionIfCached: true,
                                                                      completion: { response in
                                                                        self.activityImage?.stopAnimating()
                                                                        self.activityImage.isHidden = true
                                                                        
                                    })
                                    
                                }
                            }
                        }
                    }
                case .failure:
                    assertionFailure("some error: \(APIError.networkFailed)")
                }
            }
<<<<<<< HEAD
        } else {
            presentAlert(title: "No comics", message: "Unknown name")
        }
=======
//        } else {
//            presentAlert(title: "no image found", message: "try again")
//        }
>>>>>>> 1e90167b82d2aeadec29d50cbba0b4088c1d2414
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        activityImage?.startAnimating()
    }
}
