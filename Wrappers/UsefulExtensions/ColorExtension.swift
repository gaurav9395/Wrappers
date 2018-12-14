import UIKit

extension UIColor {
    /**
     Color from RGB codes and alpha
     - parameter red: Value of red color element desired
     - parameter green: Value of green color element desired
     - parameter blue: Value of blue color element desired
     - parameter alpha: Desired alpha
     - returns: Color instance with the desired values
     */
    static func colorWithCodes(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
    
    /**
     Color from same RGB code and alpha
     - parameter rgb: Value of RGB desired
     - parameter alpha: Desired alpha
     - returns: Color instance with the desired values
     */
    static func colorWithCode(_ rgb: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: rgb/255, green: rgb/255, blue: rgb/255, alpha: alpha)
    }
}
