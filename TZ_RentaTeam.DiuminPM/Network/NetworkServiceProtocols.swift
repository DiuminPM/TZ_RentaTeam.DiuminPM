//
// Created by DiuminPM on 25.02.2022.
//

import Foundation

protocol ArticlesNetworkProtocol {

    func requestArticles(completion: @escaping (Result<ArticlesResponse, Error>) -> Void)
}

struct ArticlesResponse: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String?
    let urlToImage: String?
}