//
//  Location.swift
//  Visuality
//
//  Created by Igor Matyushkin on 30.10.2017.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import Foundation

public enum Location {
    case nibByNameLocatedInBundle(nibName: String, bundle: Bundle?)
    case nibByNameLocatedInBundleByIdentifier(nibName: String, bundleIdentifier: String?)
    case nibByNameLocatedInMainBundle(nibName: String)
    case nibWithClassNameLocatedInBundle(bundle: Bundle?)
    case nibWithClassNameLocatedInBundleByIdentifier(bundleIdentifier: String?)
    case nibWithClassNameLocatedInMainBundle
}
