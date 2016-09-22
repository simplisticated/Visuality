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
    Loads view from nib with specified name which is located in specified bundle.
    
    - Parameters:
        - nibName: Name of nib file to load view from.
    
        - bundle: Bundle which contains specified nib file. If nil, main bundle will be used.
    
    - returns: View from nib with specified name which is located in specified bundle.
    */
    public class func VT_view(fromNibWithName nibName: String, locatedInBundle bundle: Bundle?) -> UIView {
        // Obtain bundle which is appropriate for usage
        
        let bundleToUse = bundle == nil ? Bundle.main : bundle!
        
        
        // Check whether nib exists in specified bundle
        
        let nibExists = bundleToUse.VT_containsNib(withName: nibName)
        
        
        // Obtain result view
        
        var resultView: UIView? = nil
        
        if nibExists {
            resultView = bundleToUse.VT_loadView(withClass: self, fromNibWithName: nibName)
        }
        
        if resultView == nil {
            resultView = self.init()
        }
        
        
        // Return result
        
        return resultView!
    }
    
    /**
    Loads view from nib with specified name which is located in bundle with specified identifier.
    
    - Parameters:
        - nibName: Name of nib file to load view from.
        
        - bundleIdentifier: Identifier of bundle which contains specified nib file. If nil, main bundle will be used.
    
    - returns: View from nib with specified name which is located in bundle with specified identifier.
    */
    public class func VT_view(fromNibWithName nibName: String, locatedInBundleWithIdentifier bundleIdentifier: String?) -> UIView {
        // Obtain bundle which is appropriate for usage
        
        let bundleToUse = bundleIdentifier == nil ? Bundle.main : Bundle(identifier: bundleIdentifier!)
        
        
        // Obtain result view
        
        let resultView = VT_view(fromNibWithName: nibName, locatedInBundle: bundleToUse)
        
        
        // Return result
        
        return resultView
    }
    
    /**
    Loads view from nib with specified name which is located in main bundle.
    
    - Parameters:
        - nibName: Name of nib file to load view from.
    
    - returns: View from nib with specified name which is located in main bundle.
    */
    public class func VT_view(fromNibLocatedInMainBundleWithNibName nibName: String) -> UIView {
        // Obtain bundle
        
        let bundleToUse = Bundle.main
        
        
        // Obtain result view
        
        let resultView = VT_view(fromNibWithName: nibName, locatedInBundle: bundleToUse)
        
        
        // Return result
        
        return resultView
    }
    
    /**
    Loads view from nib which name is equal to view's class name and which is located in specified bundle.
    
    - Parameters:
        - bundle: Bundle which contains specified nib file. If nil, main bundle will be used.
    
    - returns: View from nib which name is equal to view's class name and which is located in specified bundle.
    */
    public class func VT_view(fromNibWithClassNameLocatedInBundle bundle: Bundle?) -> UIView {
        // Obtain nib name
        
        let nibName = VT_classNameWithoutNamespace()
        
        
        // Obtain result view
        
        let resultView = VT_view(fromNibWithName: nibName, locatedInBundle: bundle)
        
        
        // Return result
        
        return resultView
    }
    
    /**
    Loads view from nib which name is equal to view's class name and which is located in bundle with specified identifier.
    
    - Parameters:
        - bundleIdentifier: Identifier of bundle which contains specified nib file. If nil, main bundle will be used.
    
    - returns: View from nib which name is equal to view's class name and which is located in bundle with specified identifier.
    */
    public class func VT_view(fromNibWithClassNameLocatedInBundleWithIdentifier bundleIdentifier: String?) -> UIView {
        // Obtain nib name
        
        let nibName = VT_classNameWithoutNamespace()
        
        
        // Obtain bundle which is appropriate for usage
        
        let bundleToUse = bundleIdentifier == nil ? Bundle.main : Bundle(identifier: bundleIdentifier!)
        
        
        // Obtain result view
        
        let resultView = VT_view(fromNibWithName: nibName, locatedInBundle: bundleToUse)
        
        
        // Return result
        
        return resultView
    }
    
    /**
    Loads view from nib which name is equal to view's class name and which is located in main bundle.
    
    - returns: View from nib which name is equal to view's class name and which is located in main bundle.
    */
    public class func VT_viewFromNibWithClassNameLocatedInMainBundle() -> UIView {
        // Obtain nib name
        
        let nibName = VT_classNameWithoutNamespace()
        
        
        // Obtain bundle
        
        let bundleToUse = Bundle.main
        
        
        // Obtain result view
        
        let resultView = VT_view(fromNibWithName: nibName, locatedInBundle: bundleToUse)
        
        
        // Return result
        
        return resultView
    }
    
    
    // MARK: Private class methods
    
    
    // MARK: Public object methods
    
    
    // MARK: Private object methods
    
}
