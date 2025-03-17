//
//  AppDelegate.swift
//  Dodo
//
//  Created by dreamlogin on 08.02.2025.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: MainCoordinator? 

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
       
        let navigationController = UINavigationController()
        coordinator = MainCoordinator(navigationController: navigationController)
        coordinator?.start()
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }


}

