//
//  FullScreenView.swift
//  VisualityDemo
//
//  Created by Igor Matyushkin on 24.09.15.
//  Copyright © 2015 Igor Matyushkin. All rights reserved.
//

import UIKit

class FullScreenView: UIView {
    
    // MARK: Class variables & properties
    
    
    // MARK: Class methods
    
    
    // MARK: Initializers
    
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    
    // MARK: Outlets
    
    
    // MARK: Variables & properties
    
    
    // MARK: Public methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        // Add tap gesture recognizer to view
        
        let tapGestureRecognizerForView = UITapGestureRecognizer(target: self, action: #selector(FullScreenView.viewDidTapWithGestureRecognizer(_:)))
        addGestureRecognizer(tapGestureRecognizerForView)
    }
    
    
    // MARK: Private methods
    
    internal func viewDidTapWithGestureRecognizer(_ gestureRecognizer: UIGestureRecognizer) {
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            var frameForView = UIApplication.shared.keyWindow!.bounds
            frameForView.origin.y = frameForView.size.height
            self.frame = frameForView
        }, completion: { (finished) -> Void in
            self.removeFromSuperview()
        }) 
    }
    
    
    // MARK: Actions
    
    
    // MARK: Protocol methods
    
}
