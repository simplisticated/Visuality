<p align="center" >
  <img src="https://github.com/igormatyushkin014/Visuality/blob/master/Logo/logo_1024_1024.png" alt="Visuality" title="Visuality" width="300px" height="300px">
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

### Views

Below you can find examples of view initialization by using methods from `UIView` extension.

Initialize view by name of NIB file and bundle:

```swift
let bundle = Bundle(identifier: "com.example.SomeBundleIdentifier")
let view = SomeView.from(nib: .byNibName(name: "SomeNibName"), inBundle: .byValue(bundle: bundle))
```

Initialize view by name of NIB file and bundle identifier:

```swift
let view = SomeView.from(nib: .byNibName(name: "SomeNibName"), inBundle: .byIdentifier(identifier: "com.example.SomeBundleIdentifier"))
```

Initialize view by name of NIB file stored in main bundle:

```swift
let view = SomeView.from(nib: .byNibName(name: "SomeNibName"), inBundle: .main)
```

Initialize view by name of NIB file identical to name of view class and bundle:

```swift
let bundle = Bundle(identifier: "com.example.SomeBundleIdentifier")
let view = SomeView.from(nib: .byClassName, inBundle: .byValue(bundle: bundle))
```

Initialize view by name of NIB file identical to name of view class and bundle identifier:

```swift
let view = SomeView.from(nib: .byClassName, inBundle: .byIdentifier(identifier: "com.example.SomeBundleIdentifier"))
```

Initialize view by name of NIB file that is identical to name of view class and stored in main bundle:

```swift
let view = SomeView.from(nib: .byClassName, inBundle: .main)
```

Also, you can initialize view without NIB by using `.none` value from `NibQuery`. Example:

```swift
let view = SomeView.from(nib: .none, inBundle: .main)
```

### View Controllers

Initialization of view controller instances is very similar to view's initialization. Check examples below.

Initialize view controller by name of NIB file and bundle:

```swift
let bundle = Bundle(identifier: "com.example.SomeBundleIdentifier")
let viewController = SomeViewController.from(nib: .byNibName(name: "SomeNibName"), inBundle: .byValue(bundle: bundle))
```

Initialize view controller by name of NIB file and bundle identifier:

```swift
let viewController = SomeViewController.from(nib: .byNibName(name: "SomeNibName"), inBundle: .byIdentifier(identifier: "com.example.SomeBundleIdentifier"))
```

Initialize view controller by name of NIB file stored in main bundle:

```swift
let viewController = SomeViewController.from(nib: .byNibName(name: "SomeNibName"), inBundle: .main)
```

Initialize view controller by name of NIB file identical to name of view controller class and bundle:

```swift
let bundle = Bundle(identifier: "com.example.SomeBundleIdentifier")
let viewController = SomeViewController.from(nib: .byClassName, inBundle: .byValue(bundle: bundle))
```

Initialize view by name of NIB file identical to name of view controller class and bundle identifier:

```swift
let viewController = SomeViewController.from(nib: .byClassName, inBundle: .byIdentifier(identifier: "com.example.SomeBundleIdentifier"))
```

Initialize view controller by name of NIB file that is identical to name of view controller class and stored in main bundle:

```swift
let viewController = SomeViewController.from(nib: .byClassName, inBundle: .main)
```

Similar to `UIView` initialization, it's possible to initialize view controller without NIB:

```swift
let viewController = SomeViewController.from(nib: .none, inBundle: .main)
```

## License

`Visuality` is available under the MIT license. See the `LICENSE` file for more info.
