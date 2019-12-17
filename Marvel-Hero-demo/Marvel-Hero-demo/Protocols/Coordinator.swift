//
//  Coordinator.swift
//  test
//
//  Created by Marina Huber on 10/12/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

protocol Coordinator: AnyObject {
	var presenter: UINavigationController { get }
    var childCoordinators: [Coordinator] { get set }
	func start()
}
