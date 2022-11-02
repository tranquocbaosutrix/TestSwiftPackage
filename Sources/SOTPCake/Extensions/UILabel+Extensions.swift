import UIKit

extension UILabel {
    public func setFontName(fontName: EduNetFontName = .regular,
                            fontSize: CGFloat = 14) {
        self.font = UIFont(name: fontName.rawValue, size: fontSize)
    }

    public var requiredHeight: CGFloat {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: CGFloat.greatestFiniteMagnitude))
        label.sizeToFit()
        label.font = font
        label.text = text
        label.numberOfLines = 0
        label.attributedText = attributedText
        label.lineBreakMode = NSLineBreakMode.byWordWrapping

        return label.frame.height
    }

    func addCharacterSpacing(kernValue: Double = 1.15.scale) {
        if let labelText = text, !labelText.isEmpty {
            let attributedString = NSMutableAttributedString(string: labelText)
            attributedString.addAttribute(NSAttributedString.Key.kern,
                                          value: kernValue,
                                          range: NSRange(location: 0,
                                                         length: attributedString.length - 1))
            attributedText = attributedString
        }
    }

    private func createParagrapthStyle(lineSpacing: CGFloat = 0) -> NSMutableParagraphStyle {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = self.textAlignment
        paragraphStyle.minimumLineHeight = lineSpacing
        paragraphStyle.maximumLineHeight = lineSpacing
        return paragraphStyle
    }

    func setSpannedColor (fullText: String,
                          changeText: String,
                          changeTextColor: UIColor,
                          changeTextFont: UIFont?,
                          lineSpacing: CGFloat = 0) {
        let strNumber: NSString = fullText.uppercased() as NSString
        let range = (strNumber).range(of: changeText.uppercased())
        let attribute = NSMutableAttributedString.init(string: fullText)

        if let font = changeTextFont {
            attribute.addAttribute(NSAttributedString.Key.font,
                                   value: font,
                                   range: range)
        }
        attribute.addAttribute(NSAttributedString.Key.foregroundColor,
                               value: changeTextColor, range: range)
        attribute.addAttribute(NSAttributedString.Key.paragraphStyle,
                               value: createParagrapthStyle(lineSpacing: lineSpacing),
                               range: NSRange(location: 0, length: attribute.length))

        self.attributedText = attribute
    }

    func setLineSpacing(lineSpacing: CGFloat) {
        guard let finalText = text else { return }
        let attribute = NSMutableAttributedString(string: finalText)
        let range = NSRange(location: 0,
                            length: attribute.length)
        if let finalFont = font {
            attribute.addAttribute(NSAttributedString.Key.font,
                                   value: finalFont,
                                   range: range)
        }
        if let finalTextColor = textColor {
            attribute.addAttribute(NSAttributedString.Key.foregroundColor,
                                   value: finalTextColor,
                                   range: range)
        }
        attribute.addAttribute(NSAttributedString.Key.paragraphStyle,
                               value: createParagrapthStyle(lineSpacing: lineSpacing),
                               range: NSRange(location: 0, length: attribute.length))
        attributedText = attribute
    }
}
