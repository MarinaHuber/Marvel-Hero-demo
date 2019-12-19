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
    let cellIdentifier = "cellID"
    @IBOutlet weak var tableView: UITableView!
    // private(set) var comicsArray: [ComicResult] = []
    private (set) var tableDataSource:UITableViewDiffableDataSource<Section, ComicResult>!
    let client = MarvelDataLoader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSnapshot()
        client.request(.getComics, model: ComicObjectData.self) { result in
            switch result {
            case .success:
                _ = result.map {
                    self.updateSnapshot(with: $0.data?.results ?? [], animate: true)
                }
            case .failure:
                print("some error: \(APIError.networkFailed)")
            }
        }
    }
}

private extension ComicTableViewController {
    
    private func configureSnapshot() {
        tableDataSource = UITableViewDiffableDataSource<Section, ComicResult>(tableView: self.tableView, cellProvider: {
            (tableView, indexPath, model) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier)
            cell?.textLabel?.text = model.name
            return cell
        })
    }
    
    
    private func updateSnapshot(with comicsList: [ComicResult], animate: Bool = true) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, ComicResult>()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(comicsList, toSection: .main)
        tableDataSource.apply(snapshot, animatingDifferences: animate)
    }
}

extension ComicTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let comic = tableDataSource.itemIdentifier(for: indexPath) {
            print("Selected country \(String(describing: comic.name))")
        }
    }
}
