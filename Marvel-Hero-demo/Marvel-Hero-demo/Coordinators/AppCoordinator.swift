//
//  AppCoordinator.swift
//  test
//
//  Created by Marina Huber on 10/12/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var presenter: UINavigationController

    init(navigationController: UINavigationController) {
        self.presenter = navigationController
		self.childCoordinators = []
        let red = UIColor(named: "marvelRedColor")
        let white = UIColor(named: "marvelGreyTextColor")
        presenter.navigationBar.barTintColor = red
        presenter.navigationBar.tintColor = white
        presenter.navigationBar.titleTextAttributes = [.foregroundColor : white as Any]
    }

    func start() {
		let storyboard: UIStoryboard = UIStoryboard(name: "ComicTableViewController", bundle: nil)
        let vc: ComicTableViewController = ComicTableViewController.instantiate(from: storyboard)
        presenter.show(vc, sender: nil)
	}
}

extension UINavigationController {
   open override var preferredStatusBarStyle: UIStatusBarStyle {
      return navigationController?.preferredStatusBarStyle ?? .lightContent
   }
}
