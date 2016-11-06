//
//  MainViewController.swift
//  VisualityDemo
//
//  Created by Igor Matyushkin on 21.09.15.
//  Copyright © 2015 Igor Matyushkin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: Class variables & properties
    
    
    // MARK: Class methods
    
    
    // MARK: Initializers
    
    
    // MARK: Deinitializer
    
    deinit {
        // Remove references
        
        _circleView = nil
    }
    
    
    // MARK: Outlets
    
    @IBOutlet fileprivate weak var containerForCircleView: ContainerView!
    
    
    // MARK: Variables & properties
    
    fileprivate var _circleView: CircleView!
    
    fileprivate var circleView: CircleView {
        get {
            return _circleView
        }
    }
    
    
    // MARK: Public methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Initialize circle view
        
        containerForCircleView.setContentView(ofType: CircleView.self, fromNibWithClassNameLocatedInBundle: nil, withConfigurationBlock: { (contentView) in
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: Private methods
    
    
    // MARK: Actions
    
    
    // MARK: Protocol methods
    
}
