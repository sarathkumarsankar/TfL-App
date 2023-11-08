import UIKit

class TubeLineStatusViewController: UIViewController {
    private let viewModel: TubeLineStatusViewModel
    
    init(viewModel: TubeLineStatusViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        viewModel.fetchData()
    }
    
    private func bindViewModel() {
        viewModel.updatedState = { [weak self] in
            guard let self else { return }
            DispatchQueue.main.async {
               // self.updateFromViewModel()
            }
        }
    }
}
