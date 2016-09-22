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
    }
    
    
    // MARK: Outlets
    
    @IBOutlet fileprivate weak var containerForCircleView: UIView!
    
    
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
        
        
        // Initialize container for circle view
        
        containerForCircleView.backgroundColor = .clear
        
        
        // Initialize circle view
        
        _circleView = CircleView.VT_viewFromNibWithClassNameLocatedInMainBundle() as! CircleView
        circleView.VT_fillView(view: containerForCircleView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: Private methods
    
    
    // MARK: Actions
    
    
    // MARK: Protocol methods
    
}
