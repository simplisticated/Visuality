<p align="center" >
  <img src="https://github.com/igormatyushkin014/Visuality/blob/master/Logo/logo-1024-300.png" alt="Visuality" title="Visuality">
</p>

<p align="center">
<a href="https://swift.org"><img src="https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat"></a>
<a href="https://cocoapods.org"><img src="https://img.shields.io/cocoapods/v/Visuality.svg?maxAge=2592000"></a>
<a href="https://cocoapods.org"><img src="https://img.shields.io/cocoapods/dt/Visuality.svg?maxAge=2592000"></a>
<a href="https://tldrlegal.com/license/mit-license"><img src="https://img.shields.io/badge/License-MIT-blue.svg?style=flat"></a>
</p>

# At a Glance

`Visuality` is a library for iOS which includes set of classes and extensions that simplify work with native SDK in Swift.

##How To Get Started

- Copy content of `Visuality` folder to your project.

or

- Use `Visuality` cocoapod

## Requirements

* iOS 9.0 and later
* Xcode 8 and later
* Swift 3.0 and later

## Usage

### View Initialization

This library solves a problem of loading views from nib, which usually requires to write a lot of code. With `Visuality` it's possible to initialize view with one line of code.

Examples of view initialization by using methods from `UIView` extension:

```swift
/*
 * Initialize by nib name and bundle.
 */

let someBundle1 = NSBundle(identifier: "com.example.SomeBundleIdentifier")

let someView1 = SomeView.VT_viewFromNibWithName("SomeNibName", locatedInBundle: someBundle1)


/*
 * Initialize by nib name and bundle identifier.
 */

let someView2 = SomeView.VT_viewFromNibWithName("SomeNibName", locatedInBundleWithIdentifier: "com.example.SomeBundleIdentifier")


/*
 * Initialize by nib name located in main bundle.
 */

let someView3 = SomeView.VT_viewFromNibLocatedInMainBundleWithNibName("SomeNibName")


/*
 * Also, when you send nil as value for bundle,
 * view will be loaded from main bundle too.
 */

let someView4 = SomeView.VT_viewFromNibWithName("SomeNibName", locatedInBundle: nil)


/*
 * Initialize from nib with class name and bundle.
 */

let someBundle5 = NSBundle(identifier: "com.example.SomeBundleIdentifier")

let someView5 = SomeView.VT_viewFromNibWithClassNameLocatedInBundle(someBundle5)


/*
 * Initialize from nib with class name and bundle identifier.
 */

let someView6 = SomeView.VT_viewFromNibWithClassNameLocatedInBundleWithIdentifier("com.example.SomeBundleIdentifier")


/*
 * Initialize from nib with class name located in main bundle.
 */

let someView7 = SomeView.VT_viewFromNibWithClassNameLocatedInMainBundle()


/*
 * You can do the same thing by sending nil as value for bundle identifier.
 * In this case view will be loaded from main bundle too.
 */

let someView8 = SomeView.VT_viewFromNibWithClassNameLocatedInBundleWithIdentifier(nil)

```

### Layout

`Visuality` simplifies common tasks with view's layout.

```swift
/*
 * Fit view in container.
 */

let someView = SomeView.VT_viewFromNibWithClassNameLocatedInMainBundle()
someView.VT_fillView(containerView)

/*
 * Fit view in superview.
 */

someView.VT_fillView(someView.superview!)

/*
 * Locate view in center of container.
 */

someView.VT_locateInCenterOfView(containerView)

/*
 * Do the same thing with superview.
 */

someView.VT_locateInCenterOfView(someView.superview!)

```

### Navigation

`Visuality` provides special class for simplified navigation between screens and flows in the app: `VTNavigationManager`. This class is very easy-to-use though it has set of methods which might seem to be complicated at the first look. Let's dive deeper into this.

Usually, when you want to display view controller on launch of the app, you need to write this code in `AppDelegate` class:

```swift
func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    // Create window

    let frameForWindow = UIScreen.mainScreen().bounds

    self.window = UIWindow(frame: frameForWindow)
    window!.backgroundColor = .whiteColor()
    window!.makeKeyAndVisible()


    // Display view controller

    let someViewController = SomeViewController()

    let navigationController = UINavigationController(rootViewController: someViewController)
    navigationController.navigationBarHidden = true

    window!.rootViewController = navigationController


    // Return result

    return true
}
```

And this is how you can handle the same task with `VTNavigationManager`:

```swift
func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    // Create window and display view controller

    VTNavigationManager.sharedNavigationManager().createWindowOfType(UIWindow.self, andMakeItKeyAndVisible: true) { (window) -> Void in
        window.backgroundColor = .whiteColor()
        self.window = window
    }.switchToNavigationControllerOfType(UINavigationController.self) { (navigationController) -> Void in
        let someViewController = SomeViewController()
        navigationController.viewControllers = [someViewController]
        navigationController.navigationBarHidden = true
    }


    // Return result

    return true
}
```

What's the difference? First of all, `VTNavigationManager` adds more flexibility to your code. In example above, there are two methods which were called on `VTNavigationManager`'s shared instance. The first method creates new window:

```swift
VTNavigationManager.sharedNavigationManager().createWindowOfType(UIWindow.self, andMakeItKeyAndVisible: true) { (window) -> Void in
    window.backgroundColor = .whiteColor()
    self.window = window
}
```

The first parameter is a type of window. Usually it should be `UIWindow.self`, but you might want to create custom `UIWindow` subclass. In this case, you can simply switch to new `UIWindow` subclass by replacing first parameter with appropriate type.

The second parameter shows whether window should be made key and visible automatically.

The last parameter is a configuration block which allows you to prepare window before displaying it on the screen. You can set background color, make window key and visible, etc. Also, which is important, you need to update `window` property of `AppDelegate` object within this configuration block if you want to use window as key and visible.

Next method creates navigation controller:

```swift
.switchToNavigationControllerOfType(UINavigationController.self) { (navigationController) -> Void in
    let someViewController = SomeViewController()
    navigationController.viewControllers = [someViewController]
    navigationController.navigationBarHidden = true
}
```

The first parameter is a type of navigation controller. The last parameter is a configuration block for newly created navigation controller. You can update settings of navigation controller within this block. For example, update visibility of navigation bar. Also, you can use this block to create a view controller and set view controller stack of navigation controller:

```swift
let someViewController = SomeViewController()
navigationController.viewControllers = [someViewController]
navigationController.navigationBarHidden = true
```

If you want to use your custom class for navigation bar or toolbar inside of navigation controller, there's another method:

```swift
.switchToNavigationControllerOfType(UINavigationController.self, withNavigationBarOfType: UINavigationBar.self, toolbarOfType: UIToolbar.self) { (navigationController) -> Void in
    let someViewController = SomeViewController()
    navigationController.viewControllers = [someViewController]
    navigationController.navigationBarHidden = true
}
```

The first parameter is type of navigation controller. The second parameter is a type of navigation bar. Third parameter is a type of toolbar. And, finally, the last parameter is a configuration block for navigation controller.

Sometimes you might need to display some view on the entire screen above all other views. Usually, this task could be solved by adding view to key `UIWindow` instance. `Visuality` has flexible solution for this case:

```swift
VTNavigationManager.sharedNavigationManager().addViewToKeyWindowAnimated(fullScreenView, withDuration: 2.0, prepareForAnimationBlock: { (view, window) -> Void in
    view.frame = window.bounds
    view.alpha = 0.0
}, animationBlock: { (view, window) -> Void in
    view.alpha = 1.0
}) { (finished) -> Void in
}
```

This method allows you to display view on the screen animatedly. First parameter is a view which should be added to `UIWindow` instance as a subview. Second parameter specifies duration of animation for view's appearance. Third parameter is a block which is called before appearance animation for purpose of some initial settings. Fourth parameter is an animation block. And, finally, the last parameter is a completion block.

If you don't need to program animation for view's appearance, you can use another version of this method:

```swift
VTNavigationManager.sharedNavigationManager().addViewToKeyWindow(fullScreenView) { (view, window) -> Void in
    view.backgroundColor = .whiteColor()
}
```

This method takes only two parameters: the view itself and configuration block which is called when view is added to the window.

All navigation methods of `VTNavigationManager` returns manager's object, so you can write code with chain:

```swift
VTNavigationManager.sharedNavigationManager().createWindowOfType(UIWindow.self, andMakeItKeyAndVisible: true) { (window) -> Void in
    window.backgroundColor = .whiteColor()
    self.window = window
}.switchToNavigationControllerOfType(UINavigationController.self) { (navigationController) -> Void in
    let someViewController = SomeViewController()
    navigationController.viewControllers = [someViewController]
    navigationController.navigationBarHidden = true
}.addViewToKeyWindowAnimated(fullScreenView, withDuration: 2.0, prepareForAnimationBlock: { (view, window) -> Void in
    view.frame = window.bounds
    view.alpha = 0.0
}, animationBlock: { (view, window) -> Void in
    view.alpha = 1.0
}) { (finished) -> Void in
}.addViewToKeyWindow(otherFullScreenView) { (view, window) -> Void in
}
```

## License

`Visuality` is available under the MIT license. See the `LICENSE` file for more info.

