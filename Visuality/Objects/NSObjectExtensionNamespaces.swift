//
//  NSObjectExtensionNamespaces.swift
//  Visuality
//
//  Created by Igor Matyushkin on 22.09.15.
//  Copyright © 2015 Igor Matyushkin. All rights reserved.
//

import Foundation

internal extension NSObject {
    
    // MARK: Public class methods
    
    internal class func vt_classNameWithNamespace() -> String {
        return NSStringFromClass(self)
    }
    
    internal class func vt_classNameWithoutNamespace() -> String {
        let classNameWithNamespace = vt_classNameWithNamespace()
        let segments = classNameWithNamespace.components(separatedBy: ".")
        let classNameWithoutNamespace = segments.last ?? ""
        return classNameWithoutNamespace
    }
    
    
    // MARK: Private class methods
    
    
    // MARK: Public object methods
    
    
    // MARK: Private object methods
    
}

