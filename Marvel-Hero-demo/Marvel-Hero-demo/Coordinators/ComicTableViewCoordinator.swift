//
//  ComicTableViewCoordinator.swift
//  Marvel-Hero-demo
//
//  Created by Marina Huber on 12/20/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit
///this is currently not used for the timing reason
class ComicTableViewCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var presenter: UINavigationController

    init(navigationController: UINavigationController) {
        self.presenter = navigationController
        self.childCoordinators = []
    }

    func start() {
        let storyboard: UIStoryboard = UIStoryboard(name: "DetailViewController", bundle: nil)
        let vc: DetailViewController = DetailViewController.instantiate(from: storyboard)
        presenter.show(vc, sender: nil)
    }
}
