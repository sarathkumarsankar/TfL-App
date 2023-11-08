import UIKit

extension UITableViewCell {
    @objc static var defaultIdentifier: String { return String(describing: self) }
}

extension UITableView {
    
    func registerClassWithDefaultIdentifier(cellClass: AnyClass) {
        register(cellClass, forCellReuseIdentifier: cellClass.defaultIdentifier)
    }
    
    func dequeueReusableCellWithDefaultIdentifier<T: UITableViewCell>() -> T {
        return dequeueReusableCell(withIdentifier: T.defaultIdentifier) as! T
    }
    
}
