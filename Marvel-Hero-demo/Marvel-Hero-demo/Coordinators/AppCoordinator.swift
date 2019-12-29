//
//  AppCoordinator.swift
//  test
//
//  Created by Marina Huber on 10/12/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

// MARK: All app navigation

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
<<<<<<< HEAD
        vc.delegate = self
        presenter.pushViewController(vc, animated: false)
=======
        vc.pushDetailBlock = { [weak self] in
            self?.showDetail()
        }
        presenter.show(vc, sender: nil)
>>>>>>> 1e90167b82d2aeadec29d50cbba0b4088c1d2414
	}
    private func showDetail() {
        let storyboard: UIStoryboard = UIStoryboard(name: "DetailViewController", bundle: nil)
        let vc: DetailViewController = DetailViewController.instantiate(from: storyboard)
        presenter.show(vc, sender: nil)
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

// MARK: Status bar style
extension UINavigationController {
   open override var preferredStatusBarStyle: UIStatusBarStyle {
      return navigationController?.preferredStatusBarStyle ?? .lightContent
   }
}
