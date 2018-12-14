import UIKit

extension UITextField {
    enum Side {
        case left, right
    }
    
    /**
     Show padding in a textfield
     - parameter value: Size of padding intended
     - parameter side: Side of padding intended
     */
    func setPadding(of value: CGFloat, towards side: Side) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: value, height: frame.size.height))
        switch side {
        case .left:
            leftView = paddingView
            leftViewMode = .always
        case .right:
            rightView = paddingView
            rightViewMode = .always
        }
    }
}

extension UITextField {
    private struct Properties {
        static var maxLength = Int()
        private init() {}
    }
    
    @IBInspectable var limit: Int {
        get {
            return Properties.maxLength > 0 ? Properties.maxLength : .max
        }
        set {
            Properties.maxLength = newValue
            addTarget(self, action: #selector(checkMaxLength(_:)), for: .editingChanged)
        }
    }
    
    @objc private func checkMaxLength(_ textField: UITextField) {
        guard let prospectiveText = textField.text,
            prospectiveText.count > limit else { return }
        let selection = selectedTextRange
        let indexEndOfText = prospectiveText.index(prospectiveText.startIndex, offsetBy: limit)
        text = String(prospectiveText[..<indexEndOfText])
        selectedTextRange = selection
    }
}

