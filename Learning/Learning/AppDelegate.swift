//
//  AppDelegate.swift
//  Learning
//
//  Created by Jozsef Vesza on 03/06/14.
//  Copyright (c) 2014 Jozsef Vesza. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
        if self.window {
            let rootViewContorller = self.window!.rootViewController as UINavigationController
            let mainViewModel = MainViewModel(viewController: rootViewContorller.topViewController)
        }
        return true
    }
    
}

