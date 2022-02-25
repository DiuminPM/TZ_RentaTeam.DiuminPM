//
// Created by DiuminPM on 23.02.2022.
//

import UIKit

class FeedCardView: UIView {

    private let titleLabel = UILabel()
    private let imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        addSubview(imageView)
        addSubview(titleLabel)
        layer.cornerRadius = 10
        layer.masksToBounds = true
        titleLabel.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.4)
        titleLabel.textAlignment = .center
    }

    required override init?(coder: NSCoder) {
        fatalError("Unsupported!")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        instalConstraits()
    }

    private func instalConstraits() {
        translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        imageView.frame = self.frame

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
        imageView.contentMode = .scaleAspectFill
        titleLabel.numberOfLines = 3
        setNeedsLayout()
    }
}
