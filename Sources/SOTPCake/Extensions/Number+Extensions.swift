import UIKit
import Foundation

/// Designed based on screen width: 360pt
private let designRatio: CGFloat = max(min(UIScreen.main.bounds.width, UIScreen.main.bounds.height) / 360.0, 1.0)

extension CGFloat {
    var scale: CGFloat {
        if #available(iOS 13, *) {
            return UIDevice.current.userInterfaceIdiom == .phone ? self * designRatio : self
        } else {
            return UI_USER_INTERFACE_IDIOM() == .phone ? self * designRatio : self
        }
    }
}

extension Float {
    var scale: CGFloat {
        if #available(iOS 13, *) {
            return UIDevice.current.userInterfaceIdiom == .phone
            ? CGFloat(self * Float(designRatio)).rounded()
            : CGFloat(self)
        } else {
            return UI_USER_INTERFACE_IDIOM() == .phone
            ? CGFloat(self * Float(designRatio)).rounded()
            : CGFloat(self)
        }
    }

    var scaleNoRounded: CGFloat {
        if #available(iOS 13, *) {
            return UIDevice.current.userInterfaceIdiom == .phone ? CGFloat(self * Float(designRatio)) : CGFloat(self)
        } else {
            return UI_USER_INTERFACE_IDIOM() == .phone ? CGFloat(self * Float(designRatio)) : CGFloat(self)
        }
    }
}

extension Double {
    var scale: CGFloat {
        if #available(iOS 13, *) {
            return UIDevice.current.userInterfaceIdiom == .phone
            ? CGFloat(self * Double(designRatio)).rounded()
            : CGFloat(self)
        } else {
            return UI_USER_INTERFACE_IDIOM() == .phone ? CGFloat(self * Double(designRatio)).rounded() : CGFloat(self)
        }
    }

    var scaleNoRounded: CGFloat {
        if #available(iOS 13, *) {
            return UIDevice.current.userInterfaceIdiom == .phone ? CGFloat(self * Double(designRatio)) : CGFloat(self)
        } else {
            return UI_USER_INTERFACE_IDIOM() == .phone ? CGFloat(self * Double(designRatio)) : CGFloat(self)
        }
    }
}

extension Int {
    var scale: CGFloat {
        if #available(iOS 13, *) {
            return UIDevice.current.userInterfaceIdiom == .phone
            ? (CGFloat(self) * designRatio).rounded()
            : CGFloat(self)
        } else {
            return UI_USER_INTERFACE_IDIOM() == .phone
            ? (CGFloat(self) * designRatio).rounded()
            : CGFloat(self)
        }
    }

    var scaleNoRounded: CGFloat {
        if #available(iOS 13, *) {
            return UIDevice.current.userInterfaceIdiom == .phone ? CGFloat(self) * designRatio : CGFloat(self)
        } else {
            return UI_USER_INTERFACE_IDIOM() == .phone ? CGFloat(self) * designRatio : CGFloat(self)
        }
    }
}

extension CGSize {
    var scale: CGSize {
        if #available(iOS 13, *) {
            return UIDevice.current.userInterfaceIdiom == .phone
            ? CGSize(width: self.width.scale, height: self.height.scale)
            : self
        } else {
            return UI_USER_INTERFACE_IDIOM() == .phone
            ? CGSize(width: self.width.scale, height: self.height.scale)
            : self
        }
    }
}

extension CGRect {
    var scale: CGRect {
        if #available(iOS 13, *) {
            return UIDevice.current.userInterfaceIdiom == .phone
            ? CGRect(origin: CGPoint(x: self.origin.x.scale, y: self.origin.y.scale),
                     size: CGSize(width: self.width.scale, height: self.height.scale))
            : self
        } else {
            return UI_USER_INTERFACE_IDIOM() == .phone
            ? CGRect(origin: CGPoint(x: self.origin.x.scale, y: self.origin.y.scale),
                     size: CGSize(width: self.width.scale, height: self.height.scale))
            : self
        }
    }

    var scaleSize: CGRect {
        if #available(iOS 13, *) {
            return UIDevice.current.userInterfaceIdiom == .phone
            ? CGRect(origin: self.origin, size: CGSize(width: self.width.scale, height: self.height.scale))
            : self
        } else {
            return UI_USER_INTERFACE_IDIOM() == .phone
            ? CGRect(origin: self.origin, size: CGSize(width: self.width.scale, height: self.height.scale))
            : self
        }
    }
}

extension UIEdgeInsets {
    var scale: UIEdgeInsets {
        if #available(iOS 13, *) {
            return UIDevice.current.userInterfaceIdiom == .phone
            ? UIEdgeInsets(top: self.top.scale,
                           left: self.left.scale,
                           bottom: self.bottom.scale,
                           right: self.right.scale)
            : self
        } else {
            return UI_USER_INTERFACE_IDIOM() == .phone
            ? UIEdgeInsets(top: self.top.scale,
                           left: self.left.scale,
                           bottom: self.bottom.scale,
                           right: self.right.scale)
            : self
        }
    }
}
