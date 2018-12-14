import UIKit

extension UIView {
    private struct Shadow {
        static let offset = CGSize(width: 1, height: 1)
    }
    
    private var path: UIBezierPath {
        let rect = CGRect(x: 0, y: 0, width: frame.width - Shadow.offset.width*2.5,
                          height: frame.height - Shadow.offset.height*2.5)
        let path = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius)
        return path
    }

    @IBInspectable var shadowColor: UIColor? {
        set {
            layer.shadowColor = newValue!.cgColor
        }
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            } else {
                return nil
            }
        }
    }
    
    @IBInspectable var showShadow: Bool {
        set {
            layer.masksToBounds = !newValue
            layer.shadowPath = !newValue ? path.cgPath : nil
        }
        get {
            return !layer.masksToBounds
        }
    }
    
    @IBInspectable var borderColor:UIColor? {
        set {
            layer.borderColor = newValue!.cgColor
        }
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            } else {
                return nil
            }
        }
    }
    
    @IBInspectable var borderWidth:CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius:CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
}
