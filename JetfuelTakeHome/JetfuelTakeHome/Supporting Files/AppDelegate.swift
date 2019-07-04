//
//  AppDelegate.swift
//  JetfuelTakeHome
//
//  Created by Medi Assumani on 7/2/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        showFeedPage(onWindow: window)
        return true
    }
    
    private func showFeedPage(onWindow window: UIWindow?) {
        
        if let window = window {
            
            let feedPage = ViewController()
            let destination = UINavigationController(rootViewController: feedPage)
            window.rootViewController = destination
            window.makeKeyAndVisible()
        }
    }
}

