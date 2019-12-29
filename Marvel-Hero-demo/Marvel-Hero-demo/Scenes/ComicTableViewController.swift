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
    // MARK: - Properties
    @IBOutlet weak var activityMain: UIActivityIndicatorView!
    weak var tableView: UITableView!
    var pushDetailBlock: (() -> Void)?
    private (set) var dataSource:UITableViewDiffableDataSource<Section, ComicResult>!
    let client = MarvelDataLoader()
    
    override func loadView() {
         super.loadView()
         let tableView = UITableView.init(frame: .zero, style: .insetGrouped)
         tableView.translatesAutoresizingMaskIntoConstraints = false
         tableView.rowHeight = 50
         self.view.addSubview(tableView)
         NSLayoutConstraint.activate([
             self.view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: tableView.topAnchor),
             self.view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: tableView.bottomAnchor),
             self.view.leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
             self.view.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
         ])
         self.tableView = tableView
        view.bringSubviewToFront(activityMain)
        activityMain.isHidden = false
        activityMain.startAnimating()
     }
        // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadView()
        tableView.registerCell(ofType: TableViewCell.self)
        tableView.delegate = self
        configureSnapshot()
        client.request(.getComics, model: ComicObjectData.self) { result in
            switch result {
            case .success:
                _ = result.map {
                    self.updateSnapshot(with: $0.data?.results ?? [], animate: true)
                    self.activityMain.stopAnimating()
                    self.activityMain.isHidden = true
                }
            case .failure:
                fatalError("error: \(APIError.networkFailed)")
            }
        }
    }
}
// MARK: - TableView DataSource
private extension ComicTableViewController {
    
    private func configureSnapshot() {
        dataSource = UITableViewDiffableDataSource<Section, ComicResult>(tableView: self.tableView, cellProvider: {
            (tableView, indexPath, model) -> UITableViewCell? in
            let cell = tableView.dequeueCell(ofType: TableViewCell.self, for: indexPath)
            cell.fillWithData(model)
            return cell
        })
    }
        
    private func updateSnapshot(with comicsList: [ComicResult], animate: Bool = true) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, ComicResult>()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(comicsList, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: animate)
    }
}
// MARK: - TableView Delegate
extension ComicTableViewController: UITableViewDelegate {
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let comic = dataSource.itemIdentifier(for: indexPath) {
            let storyboard: UIStoryboard = UIStoryboard(name: "DetailViewController", bundle: nil)
            let vc: DetailViewController = DetailViewController.instantiate(from: storyboard)
            vc.selectedName = comic.name ?? ""
            pushDetailBlock?()
        }
    }
}
