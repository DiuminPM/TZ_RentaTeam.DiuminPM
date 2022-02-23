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
}

protocol FeedInteractorOutput: class {
}

protocol FeedRouterInput: class {
}
