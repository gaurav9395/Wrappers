import UIKit

extension UIView {
    private static func loadViewFromXIB<T: UIView>(_ view: T.Type) -> T {
        let identifier = "\(view)"
        return Bundle(for: view).loadNibNamed(identifier, owner: nil)?.first as! T
    }
    
    /**
     Loads a view from XIB in it's Bundle
     - Take note that name of your XIB should be same as your Class's name
     */
    static func loadFromXIB() -> Self {
        return loadViewFromXIB(self)
    }
}
