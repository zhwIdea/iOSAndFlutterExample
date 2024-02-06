//
//  AppDelegate.swift
//  SwiftTestDemo
//
//  Created by zhw_mac on 2023/7/12.
//

import UIKit
//import Flutter
//import FlutterPluginRegistrant
import flutter_boost

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var appWindow: UIWindow = UIWindow()

    // 1.创建一个FlutterEngine引擎对象
    lazy var flutterEngine = FlutterEngine(name: "flutter engine")
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        appWindow = UIWindow(frame: UIScreen.main.bounds)
        appWindow.rootViewController = ProjectTabBarVC();
        appWindow.makeKeyAndVisible();

        // 启动Flutter引擎
       // flutterEngine.run()
      //  GeneratedPluginRegistrant.register(with: self.flutterEngine)
        
        let boostDelegate = BoostDelegate.shared;
        FlutterBoost.instance().setup(application, delegate: boostDelegate) { engine in
            print("")
        }
        
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

