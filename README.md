# Hideable UITabBar

## Requirements

* **iOS 11.0+**

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

Call `setTabBarHidden(_:,animated:)` func to hide / show UITabBar.
```swift
let tabBarController = UITabBarController()

// hide tabbar
tabBarController.setTabBarHidden(true, animated: true)

// show tabbar
tabBarController.setTabBarHidden(false, animated: true)
```

Library provides ability to execute additional animation by subclassing `UITabBarController` and override `tabBarHideShowAdditionalAnimations(hidden:)` func.
**RECOMMENDATION**: This functionality can be used to animate additional UI elements, for exmaple such call button. 
```swift
class TabBarController: UITabBarController {
    override func tabBarHideShowAdditionalAnimations(hidden: Bool) {
        super.tabBarHideShowAdditionalAnimations(hidden: hidden)
        
        // additional animation
    }
}
```

## License

The contents of this repository are licensed under the
[MIT License](https://github.com/dmytriigolovanov/hideable-uitabbar/blob/main/LICENSE).
