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
    var data: ComicResult?

    init(navigationController: UINavigationController) {
        // self.data = data
        self.presenter = navigationController
		self.childCoordinators = []
        let red = UIColor(named: "marvelRedColor")
        let white = UIColor(named: "marvelGreyTextColor")
        presenter.navigationBar.barTintColor = red
        presenter.navigationBar.tintColor = white
        presenter.navigationBar.titleTextAttributes = [.foregroundColor : white as Any]
    }

    public func start() {
		let storyboard: UIStoryboard = UIStoryboard(name: "ComicTableViewController", bundle: nil)
        let vc: ComicTableViewController = ComicTableViewController.instantiate(from: storyboard)
        vc.delegate = self
        presenter.pushViewController(vc, animated: false)
//        vc.showDetailAction = { [weak self] in
//            presentDetailViewController()
//        }
        
	}
}


extension AppCoordinator: DetailControllerDelegate {
    
    func presentDetailViewController(with name: String?) {
        let storyboard: UIStoryboard = UIStoryboard(name: "DetailViewController", bundle: nil)
        let vc: DetailViewController = DetailViewController.instantiate(from: storyboard)
        vc.selectedName = name ?? ""
        presenter.pushViewController(vc, animated: false)
        
        }
}



extension UINavigationController {
   open override var preferredStatusBarStyle: UIStatusBarStyle {
      return navigationController?.preferredStatusBarStyle ?? .lightContent
   }
}
