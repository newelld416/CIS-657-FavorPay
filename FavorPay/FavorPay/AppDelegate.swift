//
//  AppDelegate.swift
//  FavorPay
//
//  Created by Daniel Newell on 5/27/17.
//  Copyright © 2017 Daniel Newell. All rights reserved.
//

import UIKit
import Firebase

let THEME_COLOR1 = UIColor(red:1.00, green:0.72, blue:0.22, alpha:1.0)
let THEME_COLOR2 = UIColor(red:0.98, green:0.38, blue:0.13, alpha:1.0)
let THEME_COLOR3 = UIColor(red:0.86, green:0.91, blue:0.98, alpha:1.0)
let THEME_COLOR4 = UIColor(red:0.27, green:0.38, blue:0.54, alpha:1.0)
let THEME_COLOR5 = UIColor(red:0.63, green:0.68, blue:0.76, alpha:1.0)
let THEME_COLOR6 = UIColor(red:0.38, green:0.47, blue:0.58, alpha:1.0)


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // make the status bar more readable against darker background.
        application.statusBarStyle = UIStatusBarStyle.lightContent
        
        let navAppearance = UINavigationBar.appearance()
        navAppearance.barTintColor = THEME_COLOR4
        navAppearance.tintColor = THEME_COLOR2
        navAppearance.titleTextAttributes = [NSForegroundColorAttributeName : THEME_COLOR2]
        navAppearance.isTranslucent = false
        
        FirebaseApp.configure()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

