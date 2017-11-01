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
    
    /**
     Creates new instance of view controller.
     
     - Parameters:
         - nib: Nib query.
         - bundle: Bundle query.
     
     - returns: View controller from specified location.
     */
    public class func from(nib: NibQuery, inBundle bundle: BundleQuery) -> Self {
        let initializer = ViewControllerInitializer(viewControllerClass: self)
        return initializer.viewController(fromNib: nib, locatedInBundle: bundle)
    }
    
    /**
    Loads view controller from nib with specified name which is located in specified bundle.
    
    - Parameters:
         - nibName: Name of nib file to load view from.
         - bundle: Bundle which contains specified nib file. If nil, main bundle will be used.
    
    - returns: View controller from nib with specified name which is located in specified bundle.
    */
    @available(iOS, deprecated, message: "This method is obsolete and will be removed in upcoming update. Use `from(nib: _, inBundle: _)` instead.")
    public class func from(nibWithName nibName: String, locatedInBundle bundle: Bundle?) -> Self {
        let initializer = ViewControllerInitializer(viewControllerClass: self)
        return initializer.viewController(fromNibWithName: nibName, locatedInBundle: bundle)
    }
    
    /**
     Creates new instance of view controller from nib with specified name which is located in bundle with specified identifier.
     
     - Parameters:
         - nibName: Name of nib file to load view from.
         - bundleIdentifier: Identifier of bundle which contains specified nib file. If nil, main bundle will be used.
     
     - returns: View controller from nib with specified name which is located in bundle with specified identifier.
     */
    @available(iOS, deprecated, message: "This method is obsolete and will be removed in upcoming update. Use `from(nib: _, inBundle: _)` instead.")
    public class func from(nibWithName nibName: String, locatedInBundleWithIdentifier bundleIdentifier: String?) -> Self {
        let initializer = ViewControllerInitializer(viewControllerClass: self)
        return initializer.viewController(fromNibWithName: nibName, locatedInBundleWithIdentifier: bundleIdentifier)
    }
    
    /**
     Creates new instance of view controller from nib with specified name which is located in main bundle.
     
     - Parameters:
         - nibName: Name of nib file to load view from.
     
     - returns: View controller from nib with specified name which is located in main bundle.
     */
    @available(iOS, deprecated, message: "This method is obsolete and will be removed in upcoming update. Use `from(nib: _, inBundle: _)` instead.")
    public class func from(nibLocatedInMainBundleWithNibName nibName: String) -> Self {
        let initializer = ViewControllerInitializer(viewControllerClass: self)
        return initializer.viewController(fromNibLocatedInMainBundleWithNibName: nibName)
    }
    
    /**
     Creates new instance of view controller from nib which name is equal to view's class name and which is located in specified bundle.
     
     - Parameters:
         - bundle: Bundle which contains specified nib file. If nil, main bundle will be used.
     
     - returns: View controller from nib which name is equal to view's class name and which is located in specified bundle.
     */
    @available(iOS, deprecated, message: "This method is obsolete and will be removed in upcoming update. Use `from(nib: _, inBundle: _)` instead.")
    public class func from(nibWithClassNameLocatedInBundle bundle: Bundle?) -> Self {
        let initializer = ViewControllerInitializer(viewControllerClass: self)
        return initializer.viewController(fromNibWithClassNameLocatedInBundle: bundle)
    }
    
    /**
     Creates new instance of view controller from nib which name is equal to view's class name and which is located in bundle with specified identifier.
     
     - Parameters:
         - bundleIdentifier: Identifier of bundle which contains specified nib file. If nil, main bundle will be used.
     
     - returns: View controller from nib which name is equal to view's class name and which is located in bundle with specified identifier.
     */
    @available(iOS, deprecated, message: "This method is obsolete and will be removed in upcoming update. Use `from(nib: _, inBundle: _)` instead.")
    public class func from(nibWithClassNameLocatedInBundleWithIdentifier bundleIdentifier: String?) -> Self {
        let initializer = ViewControllerInitializer(viewControllerClass: self)
        return initializer.viewController(fromNibWithClassNameLocatedInBundleWithIdentifier: bundleIdentifier)
    }
    
    /**
     Creates new instance of view controller from nib which name is equal to view's class name and which is located in main bundle.
     
     - returns: View controller from nib which name is equal to view's class name and which is located in main bundle.
     */
    @available(iOS, deprecated, message: "This method is obsolete and will be removed in upcoming update. Use `from(nib: _, inBundle: _)` instead.")
    public class func fromNibWithClassNameLocatedInMainBundle() -> Self {
        let initializer = ViewControllerInitializer(viewControllerClass: self)
        return initializer.viewControllerFromNibWithClassNameLocatedInMainBundle()
    }
    
    // MARK: Private class methods
    
    // MARK: Public object methods
    
    // MARK: Private object methods
    
}
