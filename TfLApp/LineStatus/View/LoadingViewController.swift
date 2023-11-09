import UIKit

final class LoadingViewController: UIViewController {
    
    var activityIndicatorView: UIActivityIndicatorView!
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        activityIndicatorView = UIActivityIndicatorView(style: .medium)
        // Set accessibility label for the activity indicator
        activityIndicatorView.accessibilityLabel = "Loading"
        view.addSubview(activityIndicatorView)
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                activityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                // Adjust the vertical placement of the indicator due to naviagation bar(offset of -64)
                activityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -64)
            ]
        )
        self.view = view
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        activityIndicatorView.startAnimating()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        activityIndicatorView.stopAnimating()
    }
    
    // Function to show the loading view in a parent view controller
    func show(in parent: UIViewController) {
        parent.addChild(self)
        view.frame = parent.view.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        parent.view.addSubview(view)
        didMove(toParent: parent)
    }
    
    // Function to hide the loading view
    func hide() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
