//
//  FeedPresenter.swift
//  TZ_RentaTeam.DiuminPM
//
//  Created by DiuminPM on 22.02.2022.
//  
//

import Foundation

final class FeedPresenter {
	weak var view: FeedViewInput?
    weak var moduleOutput: FeedModuleOutput?
    
	private let router: FeedRouterInput
	private let interactor: FeedInteractorInput

    private  var articles: [Article] = []  // хранение может быть как в интеракторе так и в презентере
    
    init(router: FeedRouterInput, interactor: FeedInteractorInput) {
        self.router = router
        self.interactor = interactor
    }

}

extension FeedPresenter: FeedModuleInput {
}

extension FeedPresenter: FeedViewOutput {
    func viewDidLoad() {
        interactor.loadArticles()
    }
}

extension FeedPresenter: FeedInteractorOutput {
    func didEncounterError(_ error: Error) {
        // TODO: implement error handling
    }

    func didLoad(_ articles: [Article]) {
        self.articles = articles
        self.view?.set(viewModels: self.makeViewModels(self.articles))
    }
}

private extension FeedPresenter {

    func makeViewModels(_ articles: [Article]) -> [FeedCardViewModel] {
        return articles.map { article in
            FeedCardViewModel(
                    title: article.title ?? "",
                    imageName: article.urlToImage ?? "")
        }
    }
}
