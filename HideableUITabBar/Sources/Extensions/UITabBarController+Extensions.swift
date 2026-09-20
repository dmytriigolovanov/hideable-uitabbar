//
// Hideable UITabBar
//
// https://github.com/dmytriigolovanov/hideable-uitabbar/blob/main/LICENSE
//

import UIKit

extension UITabBarController {
    
    @objc public static let hideShowBarDuration: CGFloat = 0.2
    
    @objc public static func hideShowBarDuration(animated: Bool) -> TimeInterval {
        return animated ? TimeInterval(hideShowBarDuration) : 0
    }
    
    @objc private func tabBarOriginY(hidden: Bool) -> CGFloat {
        return view.frame.maxY - (hidden ? 0 : tabBar.frame.size.height)
    }
    
    @objc private func setTabBarOriginY(hidden: Bool) {
        self.tabBar.frame.origin.y = self.tabBarOriginY(hidden: hidden)
    }
    
    @objc private func updateTabBarOrigin() {
        self.setTabBarOriginY(hidden: tabBar.isHidden)
    }
    
    @objc private var isTabBarHidden: Bool {
        return tabBar.frame.origin.y >= view.frame.height || tabBar.isHidden
    }

    @objc public func setTabBarHidden(_ hidden: Bool, animated: Bool) {
        guard isTabBarHidden != hidden else {
            self.tabBar.isHidden = hidden
            self.updateTabBarOrigin()
            return
        }
        
        if hidden == false {
            if self.tabBar.isHidden == true {
                self.setTabBarOriginY(hidden: true)
            }
            self.tabBar.isHidden = false
        }

        let duration = Self.hideShowBarDuration(animated: animated)

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
            
            self.setTabBarOriginY(hidden: hidden)
            
            self.tabBarHideShowAdditionalAnimations(hidden: hidden)
        }, completion: { (_) in
            if hidden {
                self.tabBar.isHidden = hidden
            }
        })
    }
    
    @objc public func tabBarHideShowAdditionalAnimations(hidden: Bool) {
    }
}
