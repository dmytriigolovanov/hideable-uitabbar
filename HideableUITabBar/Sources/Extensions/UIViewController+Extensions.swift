//
// Hideable UITabBar
//
// https://github.com/dmytriigolovanov/hideable-uitabbar/blob/main/LICENSE
//

import UIKit

extension UIViewController {
    public var safeAreaCompensatingToZeroInsets: UIEdgeInsets {
        return .zero - (view.safeAreaInsets - additionalSafeAreaInsets)
    }
}
