import UIKit

extension UINavigationController {
    func setupNavigation(_ backgroundColor: UIColor,
                         tintColor: UIColor) {
        self.navigationBar.setupNavigationBarAppearance(backgroundColor, tintColor: tintColor)
    }
}
