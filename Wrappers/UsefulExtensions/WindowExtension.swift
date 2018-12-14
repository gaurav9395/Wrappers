import UIKit

extension UIWindow {
    /** @return Returns the current Top Most ViewController in hierarchy.   */
    var topMostWindowController: UIViewController? {
        var topController = rootViewController
        while let presentedController = topController?.presentedViewController {
            topController = presentedController
        }
        return topController
    }
    
    /**
     The top most view controller currently being diaplayed
     - returns: Double value rounded to passed number of places after decimal
     */
    var currentViewController: UIViewController? {
        var currentViewController = topMostWindowController
        while currentViewController != nil &&
            currentViewController is UINavigationController &&
            (currentViewController as! UINavigationController).topViewController != nil {
                currentViewController = (currentViewController as! UINavigationController).topViewController
        }
        return currentViewController
    }
}
