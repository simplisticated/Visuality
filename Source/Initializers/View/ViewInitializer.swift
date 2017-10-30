//
//  ViewInitializer.swift
//  Visuality
//
//  Created by Igor Matyushkin on 30.10.2017.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import UIKit

internal class ViewInitializer<View: UIView> {
    
    // MARK: Class variables & properties
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    public init(viewClass: View.Type) {
    }
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Object variables & properties
    
    // MARK: Public object methods
    
    /**
     Creates new instance of view.
     
     - Parameters:
         - nibQuery: Nib query.
         - bundleQuery: Bundle query.
     
     - returns: View from specified location.
     */
    public func view(fromNib nibQuery: NibQuery, locatedInBundle bundleQuery: BundleQuery) -> View {
        // Obtain bundle
        
        var nibBundle: Bundle!
        
        switch bundleQuery {
        case .main:
            nibBundle = .main
            break
        case let .byValue(bundle):
            nibBundle = bundle
            break
        case let .byIdentifier(identifier):
            nibBundle = Bundle(identifier: identifier)
            break
        }
        
        let bundleOrMain = nibBundle ?? .main
        
        // Obtain nib name
        
        var nibName: String
        
        switch nibQuery {
        case let .byNibName(name):
            nibName = name
            break
        case .byClassName:
            nibName = View.vt_classNameWithoutNamespace()
            break
        }
        
        // Check whether nib exists in specified bundle
        
        let nibExists = bundleOrMain.vt_contains(nibWithName: nibName)
        
        // Obtain result view
        
        let resultView = nibExists ? bundleOrMain.vt_load(viewOfType: View.self, fromNibWithName: nibName) : View.init()
        
        // Return result
        
        return resultView!
    }
    
    /**
    Loads view from nib with specified name which is located in specified bundle.
    
    - Parameters:
        - nibName: Name of nib file to load view from.
    
        - bundle: Bundle which contains specified nib file. If nil, main bundle will be used.
    
    - returns: View from nib with specified name which is located in specified bundle.
    */
    public func view(fromNibWithName nibName: String, locatedInBundle bundle: Bundle?) -> View {
        // Obtain bundle which is appropriate for usage
        
        let bundleOrMain = bundle ?? Bundle.main
        
        // Check whether nib exists in specified bundle
        
        let nibExists = bundleOrMain.vt_contains(nibWithName: nibName)
        
        // Obtain result view
        
        let resultView = nibExists ? bundleOrMain.vt_load(viewOfType: View.self, fromNibWithName: nibName) : View.init()
        
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
    public func view(fromNibWithName nibName: String, locatedInBundleWithIdentifier bundleIdentifier: String?) -> View {
        // Obtain bundle which is appropriate for usage
        
        let bundle = bundleIdentifier == nil ? Bundle.main : Bundle(identifier: bundleIdentifier!)
            ?? Bundle.main
        
        // Check whether nib exists in specified bundle
        
        let nibExists = bundle.vt_contains(nibWithName: nibName)
        
        // Obtain result view
        
        let resultView = nibExists ? bundle.vt_load(viewOfType: View.self, fromNibWithName: nibName) : View.init()
        
        // Return result
        
        return resultView!
    }
    
    /**
    Loads view from nib with specified name which is located in main bundle.
    
    - Parameters:
        - nibName: Name of nib file to load view from.
    
    - returns: View from nib with specified name which is located in main bundle.
    */
    public func view(fromNibLocatedInMainBundleWithNibName nibName: String) -> View {
        // Obtain bundle
        
        let bundle = Bundle.main
        
        // Check whether nib exists in specified bundle
        
        let nibExists = bundle.vt_contains(nibWithName: nibName)
        
        // Obtain result view
        
        let resultView = nibExists ? bundle.vt_load(viewOfType: View.self, fromNibWithName: nibName) : View.init()
        
        // Return result
        
        return resultView!
    }
    
    /**
    Loads view from nib which name is equal to view's class name and which is located in specified bundle.
    
    - Parameters:
        - bundle: Bundle which contains specified nib file. If nil, main bundle will be used.
    
    - returns: View from nib which name is equal to view's class name and which is located in specified bundle.
    */
    public func view(fromNibWithClassNameLocatedInBundle bundle: Bundle?) -> View {
        // Obtain nib name
        
        let nibName = View.vt_classNameWithoutNamespace()
        
        // Obtain bundle which is appropriate for usage
        
        let bundleOrMain = bundle ?? Bundle.main
        
        // Check whether nib exists in specified bundle
        
        let nibExists = bundleOrMain.vt_contains(nibWithName: nibName)
        
        // Obtain result view
        
        let resultView = nibExists ? bundleOrMain.vt_load(viewOfType: View.self, fromNibWithName: nibName) : View.init()
        
        // Return result
        
        return resultView!
    }
    
    /**
    Loads view from nib which name is equal to view's class name and which is located in bundle with specified identifier.
    
    - Parameters:
        - bundleIdentifier: Identifier of bundle which contains specified nib file. If nil, main bundle will be used.
    
    - returns: View from nib which name is equal to view's class name and which is located in bundle with specified identifier.
    */
    public func view(fromNibWithClassNameLocatedInBundleWithIdentifier bundleIdentifier: String?) -> View {
        // Obtain nib name
        
        let nibName = View.vt_classNameWithoutNamespace()
        
        // Obtain bundle which is appropriate for usage
        
        let bundleOrMain = bundleIdentifier == nil ? Bundle.main : Bundle(identifier: bundleIdentifier!)
            ?? Bundle.main
        
        // Check whether nib exists in specified bundle
        
        let nibExists = bundleOrMain.vt_contains(nibWithName: nibName)
        
        // Obtain result view
        
        let resultView = nibExists ? bundleOrMain.vt_load(viewOfType: View.self, fromNibWithName: nibName) : View.init()
        
        // Return result
        
        return resultView!
    }
    
    /**
    Loads view from nib which name is equal to view's class name and which is located in main bundle.
    
    - returns: View from nib which name is equal to view's class name and which is located in main bundle.
    */
    public func viewFromNibWithClassNameLocatedInMainBundle() -> View {
        // Obtain nib name
        
        let nibName = View.vt_classNameWithoutNamespace()
        
        // Obtain bundle
        
        let bundle = Bundle.main
        
        // Check whether nib exists in specified bundle
        
        let nibExists = bundle.vt_contains(nibWithName: nibName)
        
        // Obtain result view
        
        let resultView = nibExists ? bundle.vt_load(viewOfType: View.self, fromNibWithName: nibName) : View.init()
        
        // Return result
        
        return resultView!
    }
    
    // MARK: Private object methods
    
    // MARK: Protocol methods
    
}
