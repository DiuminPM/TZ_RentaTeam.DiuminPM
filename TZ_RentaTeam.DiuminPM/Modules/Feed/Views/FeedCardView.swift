//
// Created by DiuminPM on 23.02.2022.
//

import UIKit
import SDWebImage


class FeedCardView: UIView {

    private let titleLabel = UILabel()
    let imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(titleLabel)
        layer.cornerRadius = 10
        layer.masksToBounds = true
        titleLabel.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.4)
        titleLabel.textAlignment = .center

    }

    required init?(coder: NSCoder) {
        fatalError("Unsupported!")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        instalConstraits()
    }

    private func instalConstraits() {
        translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false

//        imageView.frame = self.frame

        NSLayoutConstraint.activate([
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor)
        ])

        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 80)
        ])

    }

    func update(with viewModel: FeedCardViewModel) {
        titleLabel.text = viewModel.title
        imageView.setImage(URL(string: viewModel.imageName))
        imageView.contentMode = .scaleToFill
        titleLabel.numberOfLines = 3
        setNeedsLayout()
    }

}
