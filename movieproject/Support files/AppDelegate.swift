//
//  AppDelegate.swift
//  movieproject
//
//  Created by Pedro Lopes on 02/10/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var moviesCoordinator: MovieListCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        self.window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()

        moviesCoordinator = MovieListCoordinator(navigationController: navigationController)
        moviesCoordinator?.start()
        
        self.window!.rootViewController = navigationController
        self.window!.makeKeyAndVisible()
        
        return true
    }
}
