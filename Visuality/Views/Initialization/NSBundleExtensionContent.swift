//
//  NSBundleExtensionContent.swift
//  Visuality
//
//  Created by Igor Matyushkin on 21.09.15.
//  Copyright © 2015 Igor Matyushkin. All rights reserved.
//

import Foundation
import UIKit

public extension Bundle {
    
    // MARK: Public class methods
    
    
    // MARK: Private class methods
    
    
    // MARK: Public object methods
    
    /**
    Checks whether nib with specified name exists in bundle.
    
    - Parameters:
        - nibName: Name of nib file.
    
    - returns: True if nib exists. Otherwise, returns false.
    */
    public func vt_contains(nibWithName nibName: String) -> Bool {
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
    public func vt_load(viewWithClass viewClass: UIView.Type, fromNibWithName nibName: String) -> UIView? {
        // Check for existance of nib
        
        let nibExists = vt_contains(nibWithName: nibName)
        
        if (!nibExists) {
            return nil
        }
        
        
        // Obtain result view
        
        let topLevelObjectsFromNib = loadNibNamed(nibName, owner: nil, options: nil) ?? [AnyObject]()
        
        let filteredTopLevelObjectsFromNib = topLevelObjectsFromNib.filter { (evaluatedObject) -> Bool in
            let requiredClassName = viewClass.vt_classNameWithNamespace()
            let evaluatedObjectClassName = (evaluatedObject as AnyObject).classForCoder.vt_classNameWithNamespace()
            let classNameOfEvaluatedObjectIsEqualToRequiredClassName = evaluatedObjectClassName == requiredClassName
            return classNameOfEvaluatedObjectIsEqualToRequiredClassName
        }
        
        let resultView: UIView? = filteredTopLevelObjectsFromNib.first as? UIView
        
        
        // Return result view
        
        return resultView;
    }
    
    
    // MARK: Private object methods
    
}
