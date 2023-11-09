import UIKit

extension UIView {
    func addSubviews(_ subviews: UIView...) {
        for subview in subviews {
            addSubview(subview)
        }
    }
}

extension UIStackView {
    
    func addArrangedSubviews(_ subviews: UIView...) {
        for subview in subviews {
            addArrangedSubview(subview)
        }
    }
    
}
