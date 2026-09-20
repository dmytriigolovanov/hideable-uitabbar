//
// Hideable UITabBar
//
// https://github.com/dmytriigolovanov/hideable-uitabbar/blob/main/LICENSE
//

import UIKit

// NOTE: As of iOS 18, Apple's UITabBarController natively declares
// `setTabBarHidden(_:animated:)` and `isTabBarHidden`. All members below are
// prefixed with `hd_` so this extension's Objective-C selectors never
// collide with (or accidentally shadow) the system implementation.
// This library is considered soft-deprecated; migrate to the native API
// when your minimum deployment target reaches iOS 18.
extension UITabBarController {

    @available(iOS, deprecated: 18.0, message: "Use the system-provided UITabBarController.setTabBarHidden(_:animated:) animation duration instead.")
    @objc
    public static let hd_hideShowBarDuration: CGFloat = 0.2

    @available(iOS, deprecated: 18.0, message: "Use the system-provided UITabBarController.setTabBarHidden(_:animated:) instead.")
    @objc
    public static func hd_hideShowBarDuration(animated: Bool) -> TimeInterval {
        return animated ? TimeInterval(hd_hideShowBarDuration) : 0
    }

    @objc
    private func hd_tabBarOriginY(hidden: Bool) -> CGFloat {
        return view.frame.maxY - (hidden ? 0 : tabBar.frame.size.height)
    }

    @objc
    private func hd_setTabBarOriginY(hidden: Bool) {
        self.tabBar.frame.origin.y = self.hd_tabBarOriginY(hidden: hidden)
    }

    @objc
    private func hd_updateTabBarOrigin() {
        self.hd_setTabBarOriginY(hidden: tabBar.isHidden)
    }

    @objc
    private var hd_isTabBarHidden: Bool {
        return tabBar.frame.origin.y >= view.frame.height || tabBar.isHidden
    }

    @available(iOS, deprecated: 18.0, message: "Use the system-provided UITabBarController.setTabBarHidden(_:animated:) instead. This library is intended to be archived once iOS 18 becomes your minimum deployment target.")
    @objc
    public func hd_setTabBarHidden(_ hidden: Bool, animated: Bool) {
        guard hd_isTabBarHidden != hidden else {
            self.tabBar.isHidden = hidden
            self.hd_updateTabBarOrigin()
            return
        }

        if hidden == false {
            if self.tabBar.isHidden == true {
                self.hd_setTabBarOriginY(hidden: true)
            }
            self.tabBar.isHidden = false
        }

        let duration = Self.hd_hideShowBarDuration(animated: animated)

        UIView.animate(withDuration: duration, animations: {
            let bottomInset = hidden ? self.safeAreaCompensatingToZeroInsets.bottom : 0
            self.additionalSafeAreaInsets.bottom = bottomInset

            self.viewControllers?.forEach({ vc in
                var vcBottomInset = hidden ? (vc.safeAreaCompensatingToZeroInsets.bottom + bottomInset) : 0
                if hidden {
                    vcBottomInset -= self.tabBar.frame.height
                }
                vc.additionalSafeAreaInsets.bottom = vcBottomInset
            })

            self.view.layoutIfNeeded()

            self.hd_setTabBarOriginY(hidden: hidden)

            self.hd_tabBarHideShowAdditionalAnimations(hidden: hidden)
        }, completion: { (_) in
            if hidden {
                self.tabBar.isHidden = hidden
            }
        })
    }

    @available(iOS, deprecated: 18.0, message: "Use the system-provided UITabBarController.setTabBarHidden(_:animated:) instead; it no longer requires a hook for additional UI animation since the system manages the whole transition.")
    @objc
    public func hd_tabBarHideShowAdditionalAnimations(hidden: Bool) {
    }
}
