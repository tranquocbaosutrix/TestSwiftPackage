import Foundation

enum LocaleType: String {
    case english = "en_US_POSIX"
    case vietnamese = "vi_VN"
}

enum DateFormatType: String {
    /// dd/MM/yyyy
    case type1 = "dd/MM/yyyy"

    /// dd/MM/yyyy, hh:mm:ss
    case type2 = "dd/MM/yyyy, hh:mm:ss"

    /// dd/MM/yyyy, HH:mm:ss (24 hours format)
    case type3 = "dd/MM/yyyy, HH:mm:ss"

    /// "yyyy-MM-dd'T'HH:mm:ss" (convert from String to Date)
    case type4 = "yyyy-MM-dd'T'HH:mm:ss"

    /// E, MMM d, yyyy
    case type5 = "E, MMM dd, yyyy"
}

extension Date {
    func formattedDate(_ dateFormat: DateFormatType, localeType: LocaleType? = nil) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat.rawValue

        if let localeType = localeType {
            dateFormatter.locale = Locale(identifier: localeType.rawValue)
        } else {
            dateFormatter.locale = Locale.current
        }

        return dateFormatter.string(from: self)
    }
}
