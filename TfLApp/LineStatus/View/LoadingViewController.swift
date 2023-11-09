import UIKit

final class LoadingViewController: UIViewController {
    
    var activityIndicatorView: UIActivityIndicatorView!
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        activityIndicatorView = UIActivityIndicatorView(style: .medium)
        view.addSubview(activityIndicatorView)
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                activityIndicatorView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                activityIndicatorView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
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
    
    func show(in parent: UIViewController) {
        parent.addChild(self)
        view.frame = parent.view.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        parent.view.addSubview(view)
        didMove(toParent: parent)
    }
    
    func hide() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
