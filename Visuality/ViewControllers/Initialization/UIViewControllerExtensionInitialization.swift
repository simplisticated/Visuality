//
//  UIViewControllerExtensionInitialization.swift
//  DisposableEmailClient
//
//  Created by Igor Matyushkin on 23.10.15.
//  Copyright © 2015 Igor Matyushkin. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController {
    
    // MARK: Public class methods
    
    /**
    Loads view controller from nib with specified name which is located in specified bundle.
    
    - Parameters:
    - nibName: Name of nib file to load view from.
    
    - bundle: Bundle which contains specified nib file. If nil, main bundle will be used.
    
    - returns: View controller from nib with specified name which is located in specified bundle.
    */
    public class func VT_viewController(fromNibWithName nibName: String, locatedInBundle bundle: Bundle?) -> UIViewController {
        // Obtain bundle which is appropriate for usage
        
        let bundleToUse = bundle == nil ? Bundle.main : bundle!
        
        
        // Check whether nib exists in specified bundle
        
        let nibExists = bundleToUse.VT_containsNib(withName: nibName)
        
        
        // Obtain result view controller
        
        var resultViewController: UIViewController? = nil
        
        if nibExists {
            resultViewController = self.init(nibName: nibName, bundle: bundleToUse)
        }
        
        if resultViewController == nil {
            resultViewController = self.init()
        }
        
        
        // Return result
        
        return resultViewController!
    }
    
    /**
     Loads view controller from nib with specified name which is located in bundle with specified identifier.
     
     - Parameters:
     - nibName: Name of nib file to load view from.
     
     - bundleIdentifier: Identifier of bundle which contains specified nib file. If nil, main bundle will be used.
     
     - returns: View controller from nib with specified name which is located in bundle with specified identifier.
     */
    public class func VT_viewController(fromNibWithName nibName: String, locatedInBundleWithIdentifier bundleIdentifier: String?) -> UIViewController {
        // Obtain bundle which is appropriate for usage
        
        let bundleToUse = bundleIdentifier == nil ? Bundle.main : Bundle(identifier: bundleIdentifier!)
        
        
        // Obtain result view controller
        
        let resultViewController = VT_viewController(fromNibWithName: nibName, locatedInBundle: bundleToUse)
        
        
        // Return result
        
        return resultViewController
    }
    
    /**
     Loads view controller from nib with specified name which is located in main bundle.
     
     - Parameters:
     - nibName: Name of nib file to load view from.
     
     - returns: View controller from nib with specified name which is located in main bundle.
     */
    public class func VT_viewController(fromNibLocatedInMainBundleWithNibName nibName: String) -> UIViewController {
        // Obtain bundle
        
        let bundleToUse = Bundle.main
        
        
        // Obtain result view controller
        
        let resultViewController = VT_viewController(fromNibWithName: nibName, locatedInBundle: bundleToUse)
        
        
        // Return result
        
        return resultViewController
    }
    
    /**
     Loads view controller from nib which name is equal to view's class name and which is located in specified bundle.
     
     - Parameters:
     - bundle: Bundle which contains specified nib file. If nil, main bundle will be used.
     
     - returns: View controller from nib which name is equal to view's class name and which is located in specified bundle.
     */
    public class func VT_viewController(fromNibWithClassNameLocatedInBundle bundle: Bundle?) -> UIViewController {
        // Obtain nib name
        
        let nibName = VT_classNameWithoutNamespace()
        
        
        // Obtain result view controller
        
        let resultViewController = VT_viewController(fromNibWithName: nibName, locatedInBundle: bundle)
        
        
        // Return result
        
        return resultViewController
    }
    
    /**
     Loads view controller from nib which name is equal to view's class name and which is located in bundle with specified identifier.
     
     - Parameters:
     - bundleIdentifier: Identifier of bundle which contains specified nib file. If nil, main bundle will be used.
     
     - returns: View controller from nib which name is equal to view's class name and which is located in bundle with specified identifier.
     */
    public class func VT_viewController(fromNibWithClassNameLocatedInBundleWithIdentifier bundleIdentifier: String?) -> UIViewController {
        // Obtain nib name
        
        let nibName = VT_classNameWithoutNamespace()
        
        
        // Obtain bundle which is appropriate for usage
        
        let bundleToUse = bundleIdentifier == nil ? Bundle.main : Bundle(identifier: bundleIdentifier!)
        
        
        // Obtain result view controller
        
        let resultViewController = VT_viewController(fromNibWithName: nibName, locatedInBundle: bundleToUse)
        
        
        // Return result
        
        return resultViewController
    }
    
    /**
     Loads view controller from nib which name is equal to view's class name and which is located in main bundle.
     
     - returns: View controller from nib which name is equal to view's class name and which is located in main bundle.
     */
    public class func VT_viewControllerFromNibWithClassNameLocatedInMainBundle() -> UIViewController {
        // Obtain nib name
        
        let nibName = VT_classNameWithoutNamespace()
        
        
        // Obtain bundle
        
        let bundleToUse = Bundle.main
        
        
        // Obtain result view controller
        
        let resultViewController = VT_viewController(fromNibWithName: nibName, locatedInBundle: bundleToUse)
        
        
        // Return result
        
        return resultViewController
    }
    
    
    // MARK: Private class methods
    
    
    // MARK: Public object methods
    
    
    // MARK: Private object methods
    
}
