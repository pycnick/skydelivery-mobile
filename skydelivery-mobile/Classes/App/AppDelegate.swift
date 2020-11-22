//
//  AppDelegate.swift
//  skydelivery-mobile
//
//  Created by pycnick on 20.11.2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let main = MainViewController()
        
        window = UIWindow()
        window?.backgroundColor = .white
        window?.rootViewController = UINavigationController(rootViewController: main)
        window?.makeKeyAndVisible()
        
        return true
    }
}

