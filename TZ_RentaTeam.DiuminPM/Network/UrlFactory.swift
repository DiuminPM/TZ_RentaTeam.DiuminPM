//
// Created by DiuminPM on 25.02.2022.
//

import Foundation

struct URLFactory {
    private static let apiKey = "7f7ffe88d5bb4bb09382a6dad38594df"
    private let urlComponents: URLComponents

    let articles: String

    init(baseURL: URL = URL(string: "https://newsapi.org/v2/")!) {
        let queryItem = URLQueryItem(name: "apiKey", value: URLFactory.apiKey)
        let params = URLQueryItem(name: "q", value: "Animals")
        let feedsCount = URLQueryItem(name: "pageSize", value: "50")
        let languageFeed = URLQueryItem(name: "language", value: "ru")
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)!
        urlComponents.queryItems = [languageFeed, params, feedsCount, queryItem]
        self.urlComponents = urlComponents
        self.articles = urlComponents.url!.appendingPathComponent("everything").absoluteString
    }
}
