//
//  UIAlertView.swift
//  Marvel-Hero-demo
//
//  Created by Marina Huber on 12/20/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit
 //MARK: Error alert

extension UIAlertController {
 func alert(message: String, title: String) {
     DispatchQueue.main.async {
         let alertController = UIAlertController(title: title, message:   message, preferredStyle: .alert)
         let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
         alertController.addAction(OKAction)
         self.present(alertController, animated: true)
     }
 }
}
