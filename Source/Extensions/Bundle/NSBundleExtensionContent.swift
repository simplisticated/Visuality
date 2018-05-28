//
//  NSBundleExtensionContent.swift
//  Visuality
//
//  Created by Igor Matyushkin on 21.09.15.
//  Copyright © 2015 Igor Matyushkin. All rights reserved.
//

import Foundation
import UIKit

internal extension Bundle {
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    // MARK: Public object methods
    
    /**
    Checks whether nib with specified name exists in bundle.
    
    - Parameters:
        - nibName: Name of nib file.
    
    - returns: True if nib exists. Otherwise, returns false.
    */
    internal func vt_containsNib(withName nibName: String) -> Bool {
        // Obtain path for nib
        
        let pathForNib = path(forResource: nibName, ofType: "nib")
        
        // Check for existance of nib
        
        var nibExists = false
        
        if pathForNib != nil {
            let fileManager = FileManager.default
            nibExists = fileManager.fileExists(atPath: pathForNib!)
        }
        
        // Return result
        
        return nibExists
    }
    
    /**
    Loads view with specified class from nib with specified name.
    
    - Parameters:
        - viewClass: Class of view to load from nib.
    
        - nibName: Name of nib file to load view from.
    
    - returns: View with specified class loaded from nib with specified name.
    */
    internal func vt_load<ViewType: UIView>(viewOfType viewType: ViewType.Type, fromNibWithName nibName: String) -> ViewType? {
        // Check for existance of nib
        
        let nibExists = vt_containsNib(withName: nibName)
        
        if (!nibExists) {
            return nil
        }
        
        // Obtain result view
        
        let topLevelObjectsFromNib = loadNibNamed(nibName, owner: nil, options: nil) ?? [AnyObject]()
        let requiredClassName = ClassFormatter(type: viewType).classNameWithNamespace()
        
        let filteredTopLevelObjectsFromNib = topLevelObjectsFromNib.filter { (evaluatedObject) -> Bool in
            let evaluatedObjectClass = (evaluatedObject as! NSObject).classForCoder as! NSObject.Type
            let evaluatedObjectClassName = ClassFormatter(type: evaluatedObjectClass).classNameWithNamespace()
            let classNameOfEvaluatedObjectIsEqualToRequiredClassName = evaluatedObjectClassName == requiredClassName
            return classNameOfEvaluatedObjectIsEqualToRequiredClassName
        }
        
        let resultView = filteredTopLevelObjectsFromNib.first as? ViewType
        
        // Return result view
        
        return resultView
    }
    
    // MARK: Private object methods
    
}
