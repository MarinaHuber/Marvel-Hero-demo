//
//  ComicTableViewController.swift
//  Marvel-Hero-demo
//
//  Created by Marina Huber on 12/17/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

final class ComicTableViewController: UIViewController, StoryboardProtocol {

    enum Section: CaseIterable {
        case main
    }

    @IBOutlet weak var tableView: UITableView!
    var comics: [ComicResult] = []
    var dataSource: UITableViewDiffableDataSource<Section, ComicResult>!
    let client = MarvelAPIClient()

    override func viewDidLoad() {
        super.viewDidLoad()
        client.request(model:[ComicResult].self) { result in
            switch result {
            case .success:
                print("\(result)")

            case .failure:
                print(result)
            }
        }
            
        dataSource = UITableViewDiffableDataSource <Section, ComicResult>(tableView: tableView) {
                (tableView: UITableView, indexPath: IndexPath,
                country: ComicResult) -> UITableViewCell? in
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                cell.textLabel?.text = country.name
                return cell
        }
        dataSource.defaultRowAnimation = .fade
    }

override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
  }
}

extension ComicTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let comic = dataSource.itemIdentifier(for: indexPath) {
            print("Selected country \(String(describing: comic.name))")
        }
    }
}
