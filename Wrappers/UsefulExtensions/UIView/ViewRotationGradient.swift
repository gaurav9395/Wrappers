import UIKit

extension UIView {
    struct Keys {
        private init() {}
        
        static let rotation = "rotationOfView"
    }
    
    /**
     Starts rotating a view at it's center
     - parameter duration: Time duration to show the rotation animation
     */
    func startRotating(withDuration duration: Double = 1) {
        if layer.animation(forKey: Keys.rotation) == nil {
            let animate = CABasicAnimation(keyPath: "transform.rotation")
            animate.duration = duration
            animate.repeatCount = Float.infinity
            animate.fromValue = 0.0
            animate.toValue = Float(Double.pi * 2.0)
            layer.add(animate, forKey: Keys.rotation)
        }
    }
    
    /**
     Stops rotation of the view
     */
    func stopRotation() {
        if layer.animation(forKey: Keys.rotation) != nil {
            layer.removeAnimation(forKey: Keys.rotation)
        }
    }
}

// MARK: - Gradient
extension UIView {
    enum Direction {
        case horizontal, vertical
        
        var startPoint: CGPoint {
            switch self {
            case .horizontal: return CGPoint(x: 0.0, y: 0.5)
            case .vertical: return CGPoint(x: 0.5, y: 0.0)
            }
        }
        
        var endPoint: CGPoint {
            switch self {
            case .horizontal: return CGPoint(x: 1.0, y: 0.5)
            case .vertical: return CGPoint(x: 0.5, y: 0.1)
            }
        }
    }
    
    /**
     Adds gradient of colors passed to the view as a sublayer
     - parameter direction: Desired direction(horizontal/vertical)
     - parameter colors: Colors produce the target gradient
     */
    func addGradientWith(direction: Direction, and colors: UIColor...) {
        let gradient = CAGradientLayer()
        gradient.colors = colors.map{ $0.cgColor }
        gradient.frame = layer.frame
        gradient.startPoint = direction.startPoint
        gradient.endPoint = direction.endPoint
        layer.insertSublayer(gradient, at: 0)
    }
}
