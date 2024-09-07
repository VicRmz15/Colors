//
//  AppDelegate.swift
//  Colors
//
//  Created by Vic Rmz on 04/09/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let viewController = ColorViperRouter.createModule()
        let navigation = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
        return true
    }
    
    
}

