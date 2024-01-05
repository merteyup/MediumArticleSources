//
//  AppDelegate.swift
//  ApplicationLifeCycle
//
//  Created by Eyüp Mert on 4.12.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        print("Application did finish launching with options.")
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        print("Application did discard scene.")
        
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        print("Application will resign active.")
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        print("Application did enter background.")
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        print("Application will enter foreground.")
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        print("Application will terminate.")
        
    }


}

