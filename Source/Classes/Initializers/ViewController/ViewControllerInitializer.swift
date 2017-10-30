//
//  ViewControllerInitializer.swift
//  Visuality
//
//  Created by Igor Matyushkin on 30.10.2017.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import UIKit

internal class ViewControllerInitializer<ViewController: UIViewController> {
    
    // MARK: Class variables & properties
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    public init(viewControllerClass: ViewController.Type) {
    }
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Object variables & properties
    
    // MARK: Public object methods

    /**
    Loads view controller from nib with specified name which is located in specified bundle.
    
    - Parameters:
    - nibName: Name of nib file to load view from.
    
    - bundle: Bundle which contains specified nib file. If nil, main bundle will be used.
    
    - returns: View controller from nib with specified name which is located in specified bundle.
    */
    public func viewController(fromNibWithName nibName: String, locatedInBundle bundle: Bundle?) -> ViewController {
        // Obtain bundle which is appropriate for usage
        
        let bundleToUse = bundle ?? Bundle.main
        
        // Check whether nib exists in specified bundle
        
        let nibExists = bundleToUse.vt_contains(nibWithName: nibName)
        
        // Obtain result view controller
        
        let resultViewController = nibExists ? ViewController.init(nibName: nibName, bundle: bundleToUse) : ViewController.init()
        
        // Return result
        
        return resultViewController
    }
    
    /**
    Loads view controller from nib with specified name which is located in bundle with specified identifier.
    
    - Parameters:
        - nibName: Name of nib file to load view from.
     
        - bundleIdentifier: Identifier of bundle which contains specified nib file. If nil, main bundle will be used.
     
    - returns: View controller from nib with specified name which is located in bundle with specified identifier.
    */
    public func viewController(fromNibWithName nibName: String, locatedInBundleWithIdentifier bundleIdentifier: String?) -> ViewController {
        // Obtain bundle which is appropriate for usage
        
        let bundleToUse = bundleIdentifier == nil ? Bundle.main : Bundle(identifier: bundleIdentifier!)
        
        // Obtain result view controller
        
        let resultViewController = self.viewController(fromNibWithName: nibName, locatedInBundle: bundleToUse)
        
        // Return result
        
        return resultViewController
    }
    
    /**
    Loads view controller from nib with specified name which is located in main bundle.
    
    - Parameters:
        - nibName: Name of nib file to load view from.
     
    - returns: View controller from nib with specified name which is located in main bundle.
    */
    public func viewController(fromNibLocatedInMainBundleWithNibName nibName: String) -> ViewController {
        // Obtain bundle
        
        let bundleToUse = Bundle.main
        
        // Obtain result view controller
        
        let resultViewController = self.viewController(fromNibWithName: nibName, locatedInBundle: bundleToUse)
        
        // Return result
        
        return resultViewController
    }
    
    /**
    Loads view controller from nib which name is equal to view's class name and which is located in specified bundle.
    
    - Parameters:
        - bundle: Bundle which contains specified nib file. If nil, main bundle will be used.
     
    - returns: View controller from nib which name is equal to view's class name and which is located in specified bundle.
    */
    public func viewController(fromNibWithClassNameLocatedInBundle bundle: Bundle?) -> ViewController {
        // Obtain nib name
        
        let nibName = ViewController.vt_classNameWithoutNamespace()
        
        // Obtain result view controller
        
        let resultViewController = self.viewController(fromNibWithName: nibName, locatedInBundle: bundle)
        
        // Return result
        
        return resultViewController
    }
    
    /**
    Loads view controller from nib which name is equal to view's class name and which is located in bundle with specified identifier.
    
    - Parameters:
        - bundleIdentifier: Identifier of bundle which contains specified nib file. If nil, main bundle will be used.
     
    - returns: View controller from nib which name is equal to view's class name and which is located in bundle with specified identifier.
    */
    public func viewController(fromNibWithClassNameLocatedInBundleWithIdentifier bundleIdentifier: String?) -> ViewController {
        // Obtain nib name
        
        let nibName = ViewController.vt_classNameWithoutNamespace()
        
        // Obtain bundle which is appropriate for usage
        
        let bundleToUse = bundleIdentifier == nil ? Bundle.main : Bundle(identifier: bundleIdentifier!)
        
        // Obtain result view controller
        
        let resultViewController = self.viewController(fromNibWithName: nibName, locatedInBundle: bundleToUse)
        
        // Return result
        
        return resultViewController
    }
    
    /**
    Loads view controller from nib which name is equal to view's class name and which is located in main bundle.
    
    - returns: View controller from nib which name is equal to view's class name and which is located in main bundle.
    */
    public func viewControllerFromNibWithClassNameLocatedInMainBundle() -> ViewController {
        // Obtain nib name
        
        let nibName = ViewController.vt_classNameWithoutNamespace()
        
        // Obtain bundle
        
        let bundleToUse = Bundle.main
        
        // Obtain result view controller
        
        let resultViewController = self.viewController(fromNibWithName: nibName, locatedInBundle: bundleToUse)
        
        // Return result
        
        return resultViewController
    }
    
    // MARK: Private object methods
    
    // MARK: Protocol methods
    
}
