//
//  UIAlertView.swift
//  Marvel-Hero-demo
//
//  Created by Marina Huber on 12/20/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

//MARK: Error alert

 protocol Alertable {
     /// Defines method for presenting `UIAlertController`.
     func presentAlert(title: String?, message: String?)
 }

 extension Alertable where Self: UIViewController {
     func presentAlert(title: String?, message: String?) {
         let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
         let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
         alertController.addAction(OKAction)
         self.present(alertController, animated: true)
     }
 }
