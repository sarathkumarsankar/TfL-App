import UIKit

class CommonUtils {
    static func showErrorAlert(in viewController: UIViewController, title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: LocalizedString(key: "status.load.error.actionButton"), style: .default, handler: nil)
        alertController.addAction(alertAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
}
