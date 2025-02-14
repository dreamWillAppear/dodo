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

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow()
        window.rootViewController = CatalogViewController()
        window.makeKeyAndVisible()
        
        self.window = window
        
        return true
    }


}

