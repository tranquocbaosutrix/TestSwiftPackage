import UIKit

extension UINavigationBar {
    func setupNavigationBarAppearance(_ backgroundColor: UIColor,
                                      tintColor: UIColor) {
        if #available(iOS 13, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = backgroundColor
            appearance.titleTextAttributes = [.foregroundColor: tintColor]
            self.standardAppearance = appearance
            self.scrollEdgeAppearance = appearance
        } else {
            self.barTintColor = backgroundColor
            self.isTranslucent = true
            self.titleTextAttributes = [.foregroundColor: tintColor]
        }
    }
}
