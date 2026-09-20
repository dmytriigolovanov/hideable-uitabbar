# Hideable UITabBar

> **Deprecation notice**: As of iOS 18, `UITabBarController` natively supports hiding/showing its tab bar with animation via `setTabBarHidden(_:animated:)` and `isTabBarHidden`. This library is soft-deprecated and will eventually be archived — please migrate to the system API once your minimum deployment target reaches iOS 18. All symbols in this library have been prefixed with `hd_` (e.g. `hd_setTabBarHidden(_:animated:)`) to avoid colliding with Apple's native members of the same name.

## Requirements

* **iOS 15.0**
* **Swift 5.5**

## Installation

See the subsections below for details about the different installation methods.
1. [CocoaPods](#cocoapods)
2. [Swift Package Manager](#swift-package-manager)

### CocoaPods

1. Prepare project for CocoaPods usage by [CocoaPods - Install / Get Started](https://cocoapods.org)
2. Add pod to project's profile
```ruby
pod 'HideableUITabBar'
```
3. **LETS ROCK!** or install pod
```console
cd {PATH_TO_PROJECT}
pod install
```


### Swift Package Manager

1. Go to project
2. `File` → `Add Packages...`
3. Search for library, using URL: 
```
https://github.com/dmytriigolovanov/hideable-uitabbar
```
4. Set the `Dependency Rule` to `Up to Next Major Version`
5. `Add Package`

## Using

Import library to needed swift file.

```swift
import HideableTabBar
```

Call `hd_setTabBarHidden(_:animated:)` func to hide / show UITabBar.
```swift
let tabBarController = UITabBarController()

// hide tabbar
tabBarController.hd_setTabBarHidden(true, animated: true)

// show tabbar
tabBarController.hd_setTabBarHidden(false, animated: true)
```

Library provides ability to execute additional animation by subclassing `UITabBarController` and override `hd_tabBarHideShowAdditionalAnimations(hidden:)` func.
**RECOMMENDATION**: This functionality can be used to animate additional UI elements, for exmaple such call button. 
```swift
class TabBarController: UITabBarController {
    override func hd_tabBarHideShowAdditionalAnimations(hidden: Bool) {
        super.hd_tabBarHideShowAdditionalAnimations(hidden: hidden)
        
        // additional animation
    }
}
```

> On iOS 18+, prefer the system API instead:
> ```swift
> tabBarController.setTabBarHidden(true, animated: true)
> ```

## License

The contents of this repository are licensed under the
[MIT License](https://github.com/dmytriigolovanov/hideable-uitabbar/blob/main/LICENSE).
