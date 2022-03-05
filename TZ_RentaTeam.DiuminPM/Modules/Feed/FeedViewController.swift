//
//  FeedViewController.swift
//  TZ_RentaTeam.DiuminPM
//
//  Created by DiuminPM on 22.02.2022.
//  
//

import UIKit

final class FeedViewController: UIViewController {
	private let output: FeedViewOutput
    private let collectionView: UICollectionView

    private var viewModels = [FeedCardViewModel]()

    init(output: FeedViewOutput) {
        self.output = output
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        view.addSubview(collectionView)
        setupCollectionView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }

    override func viewDidLoad() {
		super.viewDidLoad()
        output.viewDidLoad()
    }
}

extension FeedViewController: FeedViewInput {
    func set(viewModels: [FeedCardViewModel]) {
        self.viewModels = viewModels
        self.collectionView.reloadData()
    }
}

private extension FeedViewController {
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(FeedViewCell<FeedCardView>.self)
        collectionView.backgroundColor = .white
        collectionView.contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
}



extension FeedViewController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let viewModel = viewModels[indexPath.item]
        let cell = collectionView.dequeueCell(cellType: FeedViewCell<FeedCardView>.self, for: indexPath)
        cell.conteinerView.update(with: viewModel)
        print("1")
        return cell
    }
}

extension FeedViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let viewModel = viewModels[indexPath.item]
        let scalaImage = getScaleImage(imageName: URL(string: viewModel.imageName)!)
        let width = collectionView.frame.width - collectionView.contentInset.left - collectionView.contentInset.right
        let height = width * CGFloat(scalaImage)
        print("2")
        return  CGSize(width: width, height: height)
    }

    private func getScaleImage(imageName: URL) -> Float {
        let image = try! UIImage(data: Data(contentsOf: imageName) )
        let scalaImage = Float((image?.size.height)!) / Float((image?.size.width)!)
        return scalaImage
    }

}



