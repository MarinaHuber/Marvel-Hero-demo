//
//  ReuseIdentifierTableView.swift
//  Marvel-Hero-demo
//
//  Created by Marina Huber on 12/19/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit
        
// MARK: - Helper for TableView

extension UITableView {

    func dequeueCell<CellType: UITableViewCell>(ofType: CellType.Type, for indexPath: IndexPath) -> CellType {
        let reuseIdentifier = "\(CellType.self)"
        let someCell = self.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        guard let cell = someCell as? CellType else {
            fatalError("Could not dequeue cell of type \(CellType.self)")
        }
        return cell
    }
    
    func registerCell<CellType: UITableViewCell>(ofType: CellType.Type) {
        let reuseIdentifier = "\(CellType.self)"
        self.register(CellType.self, forCellReuseIdentifier: reuseIdentifier)
    }
}
