//
// Created by DiuminPM on 25.02.2022.
//

import Foundation

extension NetworkService: ArticlesNetworkProtocol {
    func requestArticles(completion: @escaping (Result<ArticlesResponse, Error>) -> Void) {
        let url = self.urlFactory.articles
        self.baseRequest(url: url, completion: completion)
    }
}