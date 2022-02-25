//
// Created by DiuminPM on 24.02.2022.
//

import UIKit

class AppCoordinator {

    private let appDependency: AppDependency
    private let window: UIWindow

    init(window: UIWindow, appDependency: AppDependency) {
        self.window = window
        self.appDependency = appDependency
    }



    func start() {
        let context = FeedContext(moduleDependencies: self.appDependency, moduleOutput: nil)
        let container = FeedContainer.assemble(with: context)
        window.rootViewController = container.viewController
        window.makeKeyAndVisible()
    }
}
