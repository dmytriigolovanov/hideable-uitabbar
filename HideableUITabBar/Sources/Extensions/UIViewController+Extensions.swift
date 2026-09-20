//
// Hideable UITabBar
//
// https://github.com/dmytriigolovanov/hideable-uitabbar/blob/main/LICENSE
//

import UIKit

extension UIViewController {
    @available(iOS, deprecated: 18.0, message: "This helper exists only to support HideableUITabBar's manual safe-area compensation. iOS 18 hides the tab bar natively via UITabBarController.setTabBarHidden(_:animated:), which manages safe area insets for you — no compensation needed.")
    public var safeAreaCompensatingToZeroInsets: UIEdgeInsets {
        return .zero - (view.safeAreaInsets - additionalSafeAreaInsets)
    }
}
