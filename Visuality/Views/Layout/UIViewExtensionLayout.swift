//
//  UIViewExtensionLayout.swift
//  Visuality
//
//  Created by Igor Matyushkin on 22.09.15.
//  Copyright © 2015 Igor Matyushkin. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    
    // MARK: Public class methods
    
    
    // MARK: Private class methods
    
    
    // MARK: Public object methods
    
    /**
    Changes recipient's frame to fit bounds of specified view.
    Then adds recipient to specified view as subview.
    
    - Parameters:
        - view: View that should be a superview for recipient.
    */
    public func VT_fillView(view: UIView) {
        frame = view.bounds
        
        if view != superview {
            view.addSubview(self)
        }
    }
    
    /**
    Changes recipient's frame to locate it in the center of specified view.
    Then adds recipient to specified view as subview.
    
    - Parameters:
    - view: View that should be a superview for recipient.
    */
    public func VT_locateInCenterOfView(view: UIView) {
        var frameForRecipient = frame
        frameForRecipient.origin.x = (view.frame.size.width - frameForRecipient.size.width) / 2.0
        frameForRecipient.origin.y = (view.frame.size.height - frameForRecipient.size.height) / 2.0
        frame = frameForRecipient
        
        view.addSubview(self)
    }
    
    
    // MARK: Private object methods
    
}