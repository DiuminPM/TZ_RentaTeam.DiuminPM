//
// Created by DiuminPM on 22.02.2022.
//

import UIKit

class FeedViewCell<T: UIView>: UICollectionViewCell {

    let conteinerView: T

    override init(frame: CGRect) {
        conteinerView = T(frame: .zero)
        super.init(frame: frame)
        contentView.addSubview(conteinerView)

    }

    override func layoutSubviews() {
        super.layoutSubviews()
        installConstraits()
    }

    private func installConstraits() {

        conteinerView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            conteinerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            conteinerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            conteinerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            conteinerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    required override init?(coder: NSCoder) {
        fatalError("Unsupported!")
    }
}
