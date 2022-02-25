//
//  FeedInteractor.swift
//  TZ_RentaTeam.DiuminPM
//
//  Created by DiuminPM on 22.02.2022.
//  
//

import Foundation

final class FeedInteractor {
	weak var output: FeedInteractorOutput?

	private let articlesNetworkService: ArticlesNetworkProtocol

	init(articlesNetworkService: ArticlesNetworkProtocol) {
		self.articlesNetworkService = articlesNetworkService
	}
}

extension FeedInteractor: FeedInteractorInput {
	func loadArticles() {
		self.articlesNetworkService.requestArticles { result in
			switch result {
			case .success(let response):
				self.output?.didLoad(response.articles)
			case .failure(let error):
				self.output?.didEncounterError(error)
			}
		}
	}

}
