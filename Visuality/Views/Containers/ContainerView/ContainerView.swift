//
//  ContainerView.swift
//  Visuality
//
//  Created by Igor Matyushkin on 27.03.16.
//  Copyright © 2016 Igor Matyushkin. All rights reserved.
//

import UIKit

public class ContainerView: UIView {
    
    // MARK: Class variables & properties
    
    
    // MARK: Public class methods
    
    
    // MARK: Private class methods
    
    
    // MARK: Initializers
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        customInitialization()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customInitialization()
    }
    
    
    // MARK: Deinitializer
    
    deinit {
        // Remove references
        
        _contentView = nil
    }
    
    
    // MARK: Outlets
    
    
    // MARK: Object variables & properties
    
    fileprivate var _contentView: UIView?
    
    public var contentView: UIView? {
        get {
            return _contentView
        }
        set {
            // Remove previous content view if needed
            
            if _contentView != nil {
                _contentView!.removeFromSuperview()
            }
            
            
            // Update private variable
            
            _contentView = newValue
            
            
            // Update view
            
            if newValue != nil {
                newValue!.frame = bounds
                addSubview(newValue!)
            }
        }
    }
    
    
    // MARK: Public object methods
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        
        // Update content view
        
        contentView?.frame = bounds
    }
    
    public func setContentView<ContentViewType: UIView>(ofType contentViewType: ContentViewType.Type, fromNibWithClassNameLocatedInBundle bundle: Bundle?, withConfigurationBlock configurationBlock: ((_ contentView: ContentViewType) -> Void)?) {
        // Create new content view
        
        let newContentView = ContentViewType.vt_view(fromNibWithClassNameLocatedInBundle: bundle) as! ContentViewType
        
        
        // Update current content view
        
        contentView = newContentView
        
        
        // Configure new content view if needed
        
        configurationBlock?(newContentView)
    }
    
    
    // MARK: Private object methods
    
    fileprivate func customInitialization() {
        // Initialize view
        
        backgroundColor = .clear
    }
    
    
    // MARK: Actions
    
    
    // MARK: Protocol methods
    
}
