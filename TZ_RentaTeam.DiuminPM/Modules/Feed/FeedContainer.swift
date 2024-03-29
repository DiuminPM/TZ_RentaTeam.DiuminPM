//
//  FeedContainer.swift
//  TZ_RentaTeam.DiuminPM
//
//  Created by DiuminPM on 22.02.2022.
//  
//

import UIKit

final class FeedContainer {
    let input: FeedModuleInput
	let viewController: UIViewController
	private(set) weak var router: FeedRouterInput!

	static func assemble(with context: FeedContext) -> FeedContainer {
        let router = FeedRouter()
        let interactor = FeedInteractor(articlesNetworkService: context.moduleDependencies.articlesNetworkService)
        let presenter = FeedPresenter(router: router, interactor: interactor)
		let viewController = FeedViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter

        return FeedContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: FeedModuleInput, router: FeedRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct FeedContext {
	typealias ModuleDependencies = HasArticlesNetworkService
	let moduleDependencies: ModuleDependencies
	weak var moduleOutput: FeedModuleOutput?
}
