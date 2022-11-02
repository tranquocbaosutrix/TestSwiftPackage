import UIKit
import Foundation

extension String {
    func getDate(_ dateFormat: DateFormatType) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat.rawValue
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        return dateFormatter.date(from: self)
    }

    func attributedStringWithColor(_ strings: [String],
                                   color: UIColor,
                                   characterSpacing: UInt? = nil) -> NSAttributedString {
            let attributedString = NSMutableAttributedString(string: self)
            for string in strings {
                let range = (self as NSString).range(of: string)
                attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
            }

            guard let characterSpacing = characterSpacing else {return attributedString}

            attributedString.addAttribute(NSAttributedString.Key.kern,
                                          value: characterSpacing,
                                          range: NSRange(location: 0,
                                                         length: attributedString.length))

            return attributedString
        }
}
