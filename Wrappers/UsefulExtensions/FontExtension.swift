import UIKit

extension UIFont {
    enum Font {
        case regular, bold, light, black
        
        var value: String {
            switch self {
            case .regular: return "adineuePRO-Regular"
            case .bold: return "adineuePRO-Bold"
            case .light: return "adineuePRO-Light"
            case .black: return "adineuePRO-Black"
            }
        }
    }

    /**
     Custom font described by the properties as per the parameters
     - parameter font: Font instance for desired font properties
     - parameter size: CGFloat for desired font size
     - returns: UIFont instance with the desired properties
     */
    static func custom(font: Font, ofSize size: CGFloat) -> UIFont {
        guard let font = UIFont(name: font.value, size: size) else {
            return systemFont(ofSize: size)
        }
        return font
    }
}
