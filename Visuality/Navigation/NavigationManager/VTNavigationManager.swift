//
//  VTNavigationManager.swift
//  Visuality
//
//  Created by Igor Matyushkin on 24.09.15.
//  Copyright © 2015 Igor Matyushkin. All rights reserved.
//

import UIKit

public class VTNavigationManager: NSObject {
    
    // MARK: Class variables & properties
    
    
    // MARK: Class methods
    
    public class func sharedNavigationManager() -> VTNavigationManager {
        struct Singleton {
            static var navigationManager = VTNavigationManager()
        }
        
        return Singleton.navigationManager
    }
    
    
    // MARK: Initializers
    
    public override init() {
        super.init()
    }
    
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    
    // MARK: Variables & properties
    
    
    // MARK: Public methods
    
    @discardableResult
    public func createWindowOfType<WindowType: UIWindow>(windowType: WindowType.Type, andMakeItKeyAndVisible makeKeyAndVisible: Bool, withConfigurationBlock configurationBlock: ((_ window: WindowType) -> Void)?) -> VTNavigationManager {
        // Obtain frame for window
        
        let frameForWindow = UIScreen.main.bounds
        
        
        // Create window
        
        let window = windowType.init(frame: frameForWindow)
        
        
        // Make window key and visible if needed
        
        if makeKeyAndVisible {
            window.makeKeyAndVisible()
        }
        
        
        // Configure window
        
        configurationBlock?(window)
        
        
        // Return result
        
        return self
    }
    
    @discardableResult
    public func switchToNavigationControllerOfType<NavigationControllerType: UINavigationController>(navigationControllerType: NavigationControllerType.Type, withNavigationBarOfType navigationBarType: UINavigationBar.Type, toolbarOfType toolbarType: UIToolbar.Type, andConfigurationBlock configurationBlock: ((_ navigationController: NavigationControllerType) -> Void)?) -> VTNavigationManager {
        // Obtain key window
        
        let keyWindow = UIApplication.shared.keyWindow
        
        
        // Create navigation controller
        
        let navigationController = navigationControllerType.init(navigationBarClass: navigationBarType, toolbarClass: toolbarType)
        
        
        // Configure navigation controller
        
        configurationBlock?(navigationController)
        
        
        // Switch to navigation controller
        
        keyWindow?.rootViewController = navigationController
        
        
        // Return result
        
        return self
    }
    
    @discardableResult
    public func switchToNavigationControllerOfType<NavigationControllerType: UINavigationController>(navigationControllerType: NavigationControllerType.Type, withConfigurationBlock configurationBlock: ((_ navigationController: NavigationControllerType) -> Void)?) -> VTNavigationManager {
        // Obtain navigation bar type
        
        let navigationBarType = UINavigationBar.self
        
        
        // Obtain toolbar type
        
        let toolbarType = UIToolbar.self
        
        
        // Switch to navigation controller
        
        switchToNavigationControllerOfType(navigationControllerType: navigationControllerType, withNavigationBarOfType: navigationBarType, toolbarOfType: toolbarType) { (navigationController) -> Void in
            configurationBlock?(navigationController)
        }
        
        
        // Return result
        
        return self
    }
    
    @discardableResult
    public func addViewToKeyWindow(view: UIView, withConfigurationBlock configurationBlock: ((_ view: UIView, _ window: UIWindow?) -> Void)?) -> VTNavigationManager {
        // Obtain key window
        
        let keyWindow = UIApplication.shared.keyWindow
        
        if keyWindow == nil {
            configurationBlock?(view, nil)
        }
        else {
            // Add view to window
            
            keyWindow!.addSubview(view)
            
            
            // Configure view
            
            configurationBlock?(view, keyWindow)
        }
        
        
        // Return result
        
        return self
    }
    
    @discardableResult
    public func addViewToKeyWindowAnimated(view: UIView, withDuration duration: TimeInterval, prepareForAnimationBlock: ((_ view: UIView, _ window: UIWindow) -> Void)?, animationBlock: ((_ view: UIView, _ window: UIWindow) -> Void)?, andCompletion completion: ((_ finished: Bool) -> Void)?) -> VTNavigationManager {
        // Obtain key window
        
        let keyWindow = UIApplication.shared.keyWindow
        
        if keyWindow == nil {
            completion?(false)
        }
        else {
            // Add view to window
            
            keyWindow!.addSubview(view)
            
            
            // Prepare for animation
            
            prepareForAnimationBlock?(view, keyWindow!)
            
            
            // Start animation
            
            UIView.animate(withDuration: duration, animations: { () -> Void in
                animationBlock?(view, keyWindow!)
            }, completion: { (finished) -> Void in
                completion?(finished)
            })
        }
        
        
        // Return result
        
        return self
    }
    
    
    // MARK: Private methods
    
    
    // MARK: Protocol methods
    
}
