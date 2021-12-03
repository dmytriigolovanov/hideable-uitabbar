//  MIT License
//
//  Copyright (c) 2021 Dmytrii Golovanov
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//
//  UITabBarController+Extensions.swift
//  Created by Dmytrii Golovanov on 11.02.2021.
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
