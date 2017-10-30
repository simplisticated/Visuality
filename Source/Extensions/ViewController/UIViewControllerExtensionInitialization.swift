//
//  UIViewControllerExtensionInitialization.swift
//  Visuality
//
//  Created by Igor Matyushkin on 23.10.15.
//  Copyright © 2015 Igor Matyushkin. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController {
    
    // MARK: Public class methods
    
    public class func from(_ location: Location) -> Self {
        let initializer = ViewControllerInitializer(viewControllerClass: self)
        return initializer.viewController(fromLocation: location)
    }
    
    /**
    Loads view controller from nib with specified name which is located in specified bundle.
    
    - Parameters:
    - nibName: Name of nib file to load view from.
    
    - bundle: Bundle which contains specified nib file. If nil, main bundle will be used.
    
    - returns: View controller from nib with specified name which is located in specified bundle.
    */
    public class func vt_viewController(fromNibWithName nibName: String, locatedInBundle bundle: Bundle?) -> Self {
        let initializer = ViewControllerInitializer(viewControllerClass: self)
        return initializer.viewController(fromNibWithName: nibName, locatedInBundle: bundle)
    }
    
    /**
     Loads view controller from nib with specified name which is located in bundle with specified identifier.
     
     - Parameters:
     - nibName: Name of nib file to load view from.
     
     - bundleIdentifier: Identifier of bundle which contains specified nib file. If nil, main bundle will be used.
     
     - returns: View controller from nib with specified name which is located in bundle with specified identifier.
     */
    public class func vt_viewController(fromNibWithName nibName: String, locatedInBundleWithIdentifier bundleIdentifier: String?) -> Self {
        let initializer = ViewControllerInitializer(viewControllerClass: self)
        return initializer.viewController(fromNibWithName: nibName, locatedInBundleWithIdentifier: bundleIdentifier)
    }
    
    /**
     Loads view controller from nib with specified name which is located in main bundle.
     
     - Parameters:
     - nibName: Name of nib file to load view from.
     
     - returns: View controller from nib with specified name which is located in main bundle.
     */
    public class func vt_viewController(fromNibLocatedInMainBundleWithNibName nibName: String) -> Self {
        let initializer = ViewControllerInitializer(viewControllerClass: self)
        return initializer.viewController(fromNibLocatedInMainBundleWithNibName: nibName)
    }
    
    /**
     Loads view controller from nib which name is equal to view's class name and which is located in specified bundle.
     
     - Parameters:
     - bundle: Bundle which contains specified nib file. If nil, main bundle will be used.
     
     - returns: View controller from nib which name is equal to view's class name and which is located in specified bundle.
     */
    public class func vt_viewController(fromNibWithClassNameLocatedInBundle bundle: Bundle?) -> Self {
        let initializer = ViewControllerInitializer(viewControllerClass: self)
        return initializer.viewController(fromNibWithClassNameLocatedInBundle: bundle)
    }
    
    /**
     Loads view controller from nib which name is equal to view's class name and which is located in bundle with specified identifier.
     
     - Parameters:
     - bundleIdentifier: Identifier of bundle which contains specified nib file. If nil, main bundle will be used.
     
     - returns: View controller from nib which name is equal to view's class name and which is located in bundle with specified identifier.
     */
    public class func vt_viewController(fromNibWithClassNameLocatedInBundleWithIdentifier bundleIdentifier: String?) -> Self {
        let initializer = ViewControllerInitializer(viewControllerClass: self)
        return initializer.viewController(fromNibWithClassNameLocatedInBundleWithIdentifier: bundleIdentifier)
    }
    
    /**
     Loads view controller from nib which name is equal to view's class name and which is located in main bundle.
     
     - returns: View controller from nib which name is equal to view's class name and which is located in main bundle.
     */
    public class func vt_viewControllerFromNibWithClassNameLocatedInMainBundle() -> Self {
        let initializer = ViewControllerInitializer(viewControllerClass: self)
        return initializer.viewControllerFromNibWithClassNameLocatedInMainBundle()
    }
    
    // MARK: Private class methods
    
    // MARK: Public object methods
    
    // MARK: Private object methods
    
}
