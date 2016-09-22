//
//  AppDelegate.swift
//  VisualityDemo
//
//  Created by Igor Matyushkin on 21.09.15.
//  Copyright © 2015 Igor Matyushkin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: Class variables & properties
    
    
    // MARK: Class methods
    
    
    // MARK: Initializers
    
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    
    // MARK: Variables & properties
    
    var window: UIWindow?
    
    
    // MARK: Public methods
    
    
    // MARK: Private methods
    
    
    // MARK: Protocol methods
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Create full screen view
        
        let fullScreenView = FullScreenView.VT_viewFromNibWithClassNameLocatedInMainBundle()
        
        
        // Create window and display main screen
        
        VTNavigationManager.sharedNavigationManager().createWindowOfType(windowType: UIWindow.self, andMakeItKeyAndVisible: true) { (window) -> Void in
            window.backgroundColor = .white
            self.window = window
        }.switchToNavigationControllerOfType(navigationControllerType: UINavigationController.self) { (navigationController) -> Void in
            let mainViewController = MainViewController.VT_viewControllerFromNibWithClassNameLocatedInMainBundle() as! MainViewController
            
            navigationController.viewControllers = [
                mainViewController
            ]
        }.addViewToKeyWindowAnimated(view: fullScreenView, withDuration: 2.0, prepareForAnimationBlock: { (view, window) -> Void in
            view.frame = window.bounds
            view.alpha = 0.0
        }, animationBlock: { (view, window) -> Void in
            view.alpha = 1.0
        }) { (finished) -> Void in
        }
        
        
        // Return result
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
}
