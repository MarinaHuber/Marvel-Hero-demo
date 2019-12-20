//
//  TableViewCell.swift
//  Marvel-Hero-demo
//
//  Created by Marina Huber on 12/20/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

class TableViewCell : UITableViewCell {
    
    let titleLabel: UILabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }


    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: - Data -

extension TableViewCell {

    func fillWithData(_ data: ComicResult) {
        titleLabel.text = "Comic: " + (data.name ?? "")
    }
}
// MARK: - UI -

private extension TableViewCell {

    func configureUI() {

        // StylinglessThanOrEqualTo

        titleLabel.textAlignment = .natural
        titleLabel.font = UIFont(descriptor: UIFont.preferredFont(forTextStyle: .title3).fontDescriptor.withSymbolicTraits(.traitMonoSpace)!, size: 0)
        titleLabel.textColor = .systemGray
        titleLabel.textColor = .label
        titleLabel.numberOfLines = 0


        // Layout

        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        let container = self.contentView
        container.addSubview(titleLabel)
        
        titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: UIEdgeInsets(top: 0, left: 5, bottom: 3, right: 3).left).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: UIEdgeInsets(top: 0, left: 5, bottom: 3, right: 3).right).isActive = true
        titleLabel.topAnchor.constraint(lessThanOrEqualTo: container.layoutMarginsGuide.topAnchor, constant: UIEdgeInsets(top: 0, left: 5, bottom: 3, right: 3).top).isActive = true
        titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: container.layoutMarginsGuide.bottomAnchor, constant: UIEdgeInsets(top: 0, left: 5, bottom: 3, right: 3).bottom).isActive = true
    }
}

