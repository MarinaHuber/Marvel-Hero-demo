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
    var dataSource: UITableViewDiffableDataSource<Section, [ComicResult]>!
    let client = MarvelDataLoader()

    override func viewDidLoad() {
        super.viewDidLoad()
        client.request(.getComics, model: ComicObjectData.self) { result in
            switch result {
            case .success:
                print("some stufff: \(result)")
                _ = result.map { self.setDateSource(with:
                    $0.data?.results ?? []) }

            case .failure:
                print("some error: \(APIError.networkFailed)")
            }
        }
            
    }
    
    private func setDateSource(with comics: [ComicResult]) {
               dataSource = UITableViewDiffableDataSource <Section, [ComicResult]>(tableView: tableView) {
                (tableView: UITableView, indexPath: IndexPath,
                comics: [ComicResult]) -> UITableViewCell? in
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                _ = comics.map {
                  cell.textLabel?.text = $0.name }
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
           // print("Selected country \(String(describing: comic.name))")
        }
    }
}
