//
// Hideable UITabBar
//
// https://github.com/dmytriigolovanov/hideable-uitabbar/blob/main/LICENSE
//

import UIKit

func - (lhs: UIEdgeInsets, rhs: UIEdgeInsets) -> UIEdgeInsets {
    return UIEdgeInsets(top: lhs.top - rhs.top,
                         left: lhs.left - rhs.left,
                         bottom: lhs.bottom - rhs.bottom,
                         right: lhs.right - rhs.right)
}
