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
    
    // MARK: Private class methods
    
    // MARK: Public object methods
    
    // MARK: Private object methods
    
}
