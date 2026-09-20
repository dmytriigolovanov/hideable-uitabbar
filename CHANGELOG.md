# v2.0.0

- **Breaking**: renamed all public APIs with an `hd_` prefix (e.g. `setTabBarHidden(_:animated:)` → `hd_setTabBarHidden(_:animated:)`) to avoid colliding with Apple's native `UITabBarController` API of the same name, introduced in iOS 18.
- **Breaking**: raised minimum deployment target from iOS 11.0 to iOS 15.0.
- Deprecated all public APIs in favor of the native iOS 18 tab bar hiding API.

# v1.0.0

- Initial release.
