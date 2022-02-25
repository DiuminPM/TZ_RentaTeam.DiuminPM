//
//  FeedProtocols.swift
//  TZ_RentaTeam.DiuminPM
//
//  Created by DiuminPM on 22.02.2022.
//  
//

import Foundation

protocol FeedModuleInput {
	var moduleOutput: FeedModuleOutput? { get }
}

protocol FeedModuleOutput: class {
}

protocol FeedViewInput: class {
	func set(viewModels: [FeedCardViewModel])
}

protocol FeedViewOutput: class {
		func viewDidLoad()
}

protocol FeedInteractorInput: class {
	func loadArticles()
}

protocol FeedInteractorOutput: class {
	func didEncounterError(_ error: Error)
	func didLoad(_ articles: [Article])
}

protocol FeedRouterInput: class {
}
