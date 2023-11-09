import UIKit

extension UITableViewCell {
    @objc static var defaultIdentifier: String { return String(describing: self) }
}

extension UITableView {
    
    func registerNibWithDefaultIdentifier(cellClass: AnyClass) {
        let nib = UINib(nibName: String(describing: cellClass), bundle: nil)
        register(nib, forCellReuseIdentifier: cellClass.defaultIdentifier)
    }
    
    func dequeueReusableCellWithDefaultIdentifier<T: UITableViewCell>() -> T {
        return dequeueReusableCell(withIdentifier: T.defaultIdentifier) as! T
    }
    
    func registerClassWithDefaultIdentifier(cellClass: AnyClass) {
        register(cellClass, forCellReuseIdentifier: cellClass.defaultIdentifier)
    }
    
}
