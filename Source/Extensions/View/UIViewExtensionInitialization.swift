//
//  UIViewExtensionInitialization.swift
//  Visuality
//
//  Created by Igor Matyushkin on 21.09.15.
//  Copyright © 2015 Igor Matyushkin. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    
    // MARK: Public class methods
    
    /**
     Creates new instance of view.
     
     - Parameters:
         - nibQuery: Nib query.
         - bundleQuery: Bundle query.
     
     - returns: View from specified location.
     */
    public class func from(nib: NibQuery, inBundle bundle: BundleQuery) -> Self {
        let initializer = ViewInitializer(viewClass: self)
        return initializer.view(fromNib: nib, locatedInBundle: bundle)
    }
    
    /**
    Loads view from nib with specified name which is located in specified bundle.
    
    - Parameters:
        - nibName: Name of nib file to load view from.
    
        - bundle: Bundle which contains specified nib file. If nil, main bundle will be used.
    
    - returns: View from nib with specified name which is located in specified bundle.
    */
    public class func from(nibWithName nibName: String, locatedInBundle bundle: Bundle?) -> Self {
        let initializer = ViewInitializer(viewClass: self)
        return initializer.view(fromNibWithName: nibName, locatedInBundle: bundle)
    }
    
    /**
    Loads view from nib with specified name which is located in bundle with specified identifier.
    
    - Parameters:
        - nibName: Name of nib file to load view from.
        
        - bundleIdentifier: Identifier of bundle which contains specified nib file. If nil, main bundle will be used.
    
    - returns: View from nib with specified name which is located in bundle with specified identifier.
    */
    public class func from(nibWithName nibName: String, locatedInBundleWithIdentifier bundleIdentifier: String?) -> Self {
        let initializer = ViewInitializer(viewClass: self)
        return initializer.view(fromNibWithName: nibName, locatedInBundleWithIdentifier: bundleIdentifier)
    }
    
    /**
    Loads view from nib with specified name which is located in main bundle.
    
    - Parameters:
        - nibName: Name of nib file to load view from.
    
    - returns: View from nib with specified name which is located in main bundle.
    */
    public class func from(nibLocatedInMainBundleWithNibName nibName: String) -> Self {
        let initializer = ViewInitializer(viewClass: self)
        return initializer.view(fromNibLocatedInMainBundleWithNibName: nibName)
    }
    
    /**
    Loads view from nib which name is equal to view's class name and which is located in specified bundle.
    
    - Parameters:
        - bundle: Bundle which contains specified nib file. If nil, main bundle will be used.
    
    - returns: View from nib which name is equal to view's class name and which is located in specified bundle.
    */
    public class func from(nibWithClassNameLocatedInBundle bundle: Bundle?) -> Self {
        let initializer = ViewInitializer(viewClass: self)
        return initializer.view(fromNibWithClassNameLocatedInBundle: bundle)
    }
    
    /**
    Loads view from nib which name is equal to view's class name and which is located in bundle with specified identifier.
    
    - Parameters:
        - bundleIdentifier: Identifier of bundle which contains specified nib file. If nil, main bundle will be used.
    
    - returns: View from nib which name is equal to view's class name and which is located in bundle with specified identifier.
    */
    public class func from(nibWithClassNameLocatedInBundleWithIdentifier bundleIdentifier: String?) -> Self {
        let initializer = ViewInitializer(viewClass: self)
        return initializer.view(fromNibWithClassNameLocatedInBundleWithIdentifier: bundleIdentifier)
    }
    
    /**
    Loads view from nib which name is equal to view's class name and which is located in main bundle.
    
    - returns: View from nib which name is equal to view's class name and which is located in main bundle.
    */
    public class func fromNibWithClassNameLocatedInMainBundle() -> Self {
        let initializer = ViewInitializer(viewClass: self)
        return initializer.viewFromNibWithClassNameLocatedInMainBundle()
    }
    
    // MARK: Private class methods
    
    // MARK: Public object methods
    
    // MARK: Private object methods
    
}
