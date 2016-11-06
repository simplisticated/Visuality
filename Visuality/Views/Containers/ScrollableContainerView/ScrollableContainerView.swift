//
//  ScrollableContainerView.swift
//  VisualityDemo
//
//  Created by Igor Matyushkin on 06.11.16.
//  Copyright © 2016 Igor Matyushkin. All rights reserved.
//

import UIKit

public class ScrollableContainerView: UIView {
    
    // MARK: Class variables & properties
    
    
    // MARK: Public class methods
    
    
    // MARK: Private class methods
    
    fileprivate class func defaultScrollDirection() -> ScrollableContainerViewScrollDirection {
        return .vertical
    }
    
    
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
        
        _internalScrollView = nil
        _contentView = nil
        _scrollDirection = nil
    }
    
    
    // MARK: Outlets
    
    
    // MARK: Object variables & properties
    
    fileprivate var _internalScrollView: UIScrollView!
    
    fileprivate var internalScrollView: UIScrollView {
        get {
            return _internalScrollView
        }
    }
    
    fileprivate var _contentView: UIView?
    
    public var contentView: UIView? {
        get {
            return _contentView
        }
        set {
            // Update content view
            
            setContentView(contentView: newValue, forScrollDirection: scrollDirection)
        }
    }
    
    fileprivate var _scrollDirection: ScrollableContainerViewScrollDirection!
    
    public var scrollDirection: ScrollableContainerViewScrollDirection {
        get {
            return _scrollDirection
        }
        set {
            // Update private variable
            
            _scrollDirection = newValue
            
            
            // Update content view
            
            setContentView(contentView: _contentView, forScrollDirection: newValue)
        }
    }
    
    fileprivate func setContentView(contentView: UIView?, forScrollDirection scrollDirection: ScrollableContainerViewScrollDirection) {
        // Remove previous content view if needed
        
        if _contentView != nil {
            _contentView!.removeFromSuperview()
        }
        
        
        // Update private variable
        
        _contentView = contentView
        
        
        // Update internal scroll view
        
        if contentView == nil {
            // Update container
            
            internalScrollView.contentSize = .zero
        } else {
            // Obtain frame for content view
            
            var frameForContentView: CGRect?
            
            switch scrollDirection {
            case .horizontal:
                frameForContentView = CGRect(x: 0.0, y: 0.0, width: contentView!.bounds.size.width, height: internalScrollView.bounds.size.height)
                break
            case .vertical:
                frameForContentView = CGRect(x: 0.0, y: 0.0, width: internalScrollView.bounds.size.width, height: contentView!.bounds.size.height)
                break
            }
            
            
            // Update content view
            
            contentView!.frame = frameForContentView!
            
            
            // Update container
            
            internalScrollView.contentSize = frameForContentView!.size
            internalScrollView.addSubview(contentView!)
        }
    }
    
    
    // MARK: Public object methods
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        
        // Update internal scroll view
        
        internalScrollView.frame = bounds
    }
    
    public func setContentView<ContentViewType: UIView>(ofType contentViewType: ContentViewType.Type, fromNibWithClassNameLocatedInBundle bundle: Bundle?, withScrollDirection scrollDirection: ScrollableContainerViewScrollDirection, andConfigurationBlock configurationBlock: ((_ contentView: ContentViewType) -> Void)?) {
        // Create new content view
        
        let newContentView = ContentViewType.vt_view(fromNibWithClassNameLocatedInBundle: bundle) as! ContentViewType
        
        
        // Update scroll direction
        
        _scrollDirection = scrollDirection
        
        
        // Update current content view
        
        contentView = newContentView
        
        
        // Configure new content view if needed
        
        configurationBlock?(newContentView)
    }
    
    
    // MARK: Private object methods
    
    fileprivate func customInitialization() {
        // Initialize view
        
        backgroundColor = .clear
        
        
        // Initialize internal scroll view
        
        _internalScrollView = UIScrollView(frame: bounds)
        internalScrollView.backgroundColor = .clear
        
        addSubview(internalScrollView)
        
        
        // Initialize scroll direction
        
        _scrollDirection = ScrollableContainerView.defaultScrollDirection()
        
        
        // Update view
        
        setNeedsLayout()
    }
    
    
    // MARK: Actions
    
    
    // MARK: Protocol methods
    
}
