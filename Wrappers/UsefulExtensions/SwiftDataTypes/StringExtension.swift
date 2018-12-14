import Foundation

extension String {
    /**
     Localized value of the string, useful in multiple language support
     */
    var localized: String {
        return NSLocalizedString(self, comment: self)
    }
    
}
