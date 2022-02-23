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
    
    init(router: FeedRouterInput, interactor: FeedInteractorInput) {
        self.router = router
        self.interactor = interactor
    }

}

extension FeedPresenter: FeedModuleInput {
}

extension FeedPresenter: FeedViewOutput {
    func viewDidLoad() {
        view?.set(viewModels: self.makeViewModels())
    }
}

extension FeedPresenter: FeedInteractorOutput {
}

private extension FeedPresenter {

    func makeViewModels() -> [FeedCardViewModel] {
        return  [FeedCardViewModel(title: "Кокер спаниелб по кличке Чуи", imageName: "chewie")]
    }
}
