//
//  AppDelegate.swift
//  TZ_RentaTeam.DiuminPM
//
//  Created by DiuminPM on 22.02.2022.
//
//

import UIKit


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let context = FeedContext(moduleOutput: nil)
        let container = FeedContainer.assemble(with: context)
        let window = UIWindow(frame: UIScreen.main.bounds)

        self.window = window
        window.rootViewController = container.viewController
        window.makeKeyAndVisible()
        return true
    }



}
