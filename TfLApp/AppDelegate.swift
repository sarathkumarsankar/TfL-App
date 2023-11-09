import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var window: UIWindow? = UIWindow()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let viewModel = TubeLineStatusViewModel(apiManager: APIManager())
        let navigationController = UINavigationController()
        navigationController.view.backgroundColor = .white
        navigationController.viewControllers = [TubeLineStatusViewController(viewModel: viewModel)]
        window!.rootViewController = navigationController
        window!.makeKeyAndVisible()
        return true
    }
}
