//
//  TableViewCell.swift
//  Marvel-Hero-demo
//
//  Created by Marina Huber on 12/17/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

class TableViewCell : UITableViewCell {
    let titleLabel: UILabel = UILabel()



    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: - Data -

extension TableViewCell {

    func fillWithData(_ data: [ComicResult]) {
       // titleLabel.text = data.map { $0.name }
    }
}
// MARK: - UI -

private extension TableViewCell {

    func configureUI() {

        // Styling

        titleLabel.textAlignment = .natural
        titleLabel.font = UIFont(descriptor: UIFont.preferredFont(forTextStyle: .title3).fontDescriptor.withSymbolicTraits(.traitBold)!, size: 0)
        titleLabel.textColor = .systemBlue


        let stackView = UIStackView(arrangedSubviews: [titleLabel])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 5

        // Layout

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false

        let container = self.contentView

        container.addSubview(stackView)

        stackView.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(lessThanOrEqualTo: container.bottomAnchor).isActive = true
    }
}
