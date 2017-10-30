<p align="center" >
  <img src="https://github.com/igormatyushkin014/Visuality/blob/master/Logo/logo-1024-300.png" alt="Visuality" title="Visuality">
</p>

<p align="center">
<a href="https://swift.org"><img src="https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat"></a>
<a href="https://cocoapods.org"><img src="https://img.shields.io/cocoapods/v/Visuality.svg?maxAge=2592000"></a>
<a href="https://cocoapods.org"><img src="https://img.shields.io/cocoapods/dt/Visuality.svg?maxAge=2592000"></a>
<a href="https://tldrlegal.com/license/mit-license"><img src="https://img.shields.io/badge/License-MIT-blue.svg?style=flat"></a>
</p>

# Visuality

Very often iOS developers face the problem of initializing view (or view controller) from NIB. Natively, iOS SDK requires developer to write a lot of code in this case:

1. check programmatically existence of bundle where the NIB file is stored ☹️
2. check existence of the NIB file inside of the bundle 😔
3. load content from the NIB 😠
4. find appropriate view from array of different elements 😡😡😡

`Visuality` solves the problem described above. You can initialize view (and of course view controller) from NIB located in any bundle with just a one line of code! Sounds quite simple, isn't it? 😉

Also, `Visuality` provides developer with special tools that simplify creating new window and switching between navigation controllers. Welcome to the world of low complexity! 😀

## How To Get Started

- Copy content of `Source` folder to your project.

or

- Use `Visuality` cocoapod

## Requirements

* iOS 9 and later
* Xcode 9 and later
* Swift 4

## Usage

### View Initialization

This library solves a problem of loading views from nib, which usually requires to write a lot of code. With `Visuality` it's possible to initialize view with one line of code.

Examples of view initialization by using methods from `UIView` extension:

```swift
/*
 * Initialize by nib name and bundle.
 */

let someBundle1 = Bundle(identifier: "com.example.SomeBundleIdentifier")

let someView1 = SomeView.vt_view(fromNibWithName: "SomeNibName", locatedInBundle: someBundle1)

/*
 * Initialize by nib name and bundle identifier.
 */

let someView2 = SomeView.vt_view(fromNibWithName: "SomeNibName", locatedInBundleWithIdentifier: "com.example.SomeBundleIdentifier")

/*
 * Initialize by nib name located in main bundle.
 */

let someView3 = SomeView.vt_view(fromNibLocatedInMainBundleWithNibName: "SomeNibName")

/*
 * Also, when you send nil as value for bundle,
 * view will be loaded from main bundle too.
 */

let someView4 = SomeView.vt_view(fromNibWithName: "SomeNibName", locatedInBundle: nil)

/*
 * Initialize from nib with class name and bundle.
 */

let someBundle5 = Bundle(identifier: "com.example.SomeBundleIdentifier")

let someView5 = SomeView.vt_view(fromNibWithClassNameLocatedInBundle: someBundle5)

/*
 * Initialize from nib with class name and bundle identifier.
 */

let someView6 = SomeView.vt_view(fromNibWithClassNameLocatedInBundleWithIdentifier: "com.example.SomeBundleIdentifier")

/*
 * Initialize from nib with class name located in main bundle.
 */

let someView7 = SomeView.vt_viewFromNibWithClassNameLocatedInMainBundle()

/*
 * You can do the same thing by sending nil as value for bundle identifier.
 * In this case view will be loaded from main bundle too.
 */

let someView8 = SomeView.vt_view(fromNibWithClassNameLocatedInBundleWithIdentifier: nil)
```

### Navigation

`Visuality` provides special class for simplified navigation between screens and flows in the app: `VTNavigationManager`. This class is very easy-to-use though it has set of methods which might seem to be complicated at the first look. Let's dive deeper into this.

Usually, when you want to display view controller on launch of the app, you need to write this code in `AppDelegate` class:

```swift
func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    // Create window

    let frameForWindow = UIScreen.main.bounds

    self.window = UIWindow(frame: frameForWindow)
    window!.backgroundColor = .white
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

    VTNavigationManager.shared.create(windowOfType: UIWindow.self, andMakeItKeyAndVisible: true) { (window) -> Void in
        window.backgroundColor = .whiteColor()
        self.window = window
    }.move(toNavigationControllerOfType: UINavigationController.self) { (navigationController) -> Void in
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
VTNavigationManager.shared.create(windowOfType: UIWindow.self, andMakeItKeyAndVisible: true) { (window) -> Void in
    window.backgroundColor = .whiteColor()
    self.window = window
}
```

The first parameter is a type of window. Usually it should be `UIWindow.self`, but you might want to create custom `UIWindow` subclass. In this case, you can simply switch to new `UIWindow` subclass by replacing first parameter with appropriate type.

The second parameter shows whether window should be made key and visible automatically.

The last parameter is a configuration block which allows you to prepare window before displaying it on the screen. You can set background color, make window key and visible, etc. Also, which is important, you need to update `window` property of `AppDelegate` object within this configuration block if you want to use window as key and visible.

Next method creates navigation controller:

```swift
.move(toNavigationControllerOfType: UINavigationController.self) { (navigationController) -> Void in
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
.move(toNavigationControllerOfType: UINavigationController.self, withNavigationBarOfType: UINavigationBar.self, toolbarOfType: UIToolbar.self) { (navigationController) -> Void in
    let someViewController = SomeViewController()
    navigationController.viewControllers = [someViewController]
    navigationController.navigationBarHidden = true
}
```

The first parameter is type of navigation controller. The second parameter is a type of navigation bar. Third parameter is a type of toolbar. And, finally, the last parameter is a configuration block for navigation controller.

All navigation methods of `VTNavigationManager` returns manager's object, so you can write code with chain:

```swift
VTNavigationManager.sharedNavigationManager().create(windowOfType: UIWindow.self, andMakeItKeyAndVisible: true) { (window) -> Void in
    window.backgroundColor = .whiteColor()
    self.window = window
}.move(toNavigationControllerOfType: UINavigationController.self) { (navigationController) -> Void in
    let someViewController = SomeViewController()
    navigationController.viewControllers = [someViewController]
    navigationController.navigationBarHidden = true
}
```

## License

`Visuality` is available under the MIT license. See the `LICENSE` file for more info.
