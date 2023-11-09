import UIKit

final class TubeLineStatusViewController: UITableViewController {
    private let viewModel: TubeLineStatusViewModel
    let loadingViewController = LoadingViewController()
    
    init(viewModel: TubeLineStatusViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = LocalizedString(key:"status.title")
        configureTableView()
        updateFromViewModel()
        bindViewModel()
        viewModel.fetchData()
    }
    
    private func configureTableView() {
        tableView.registerNibWithDefaultIdentifier(cellClass: TubeLineStatusCell.self)
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func bindViewModel() {
        viewModel.updatedState = { [weak self] in
            guard let self else { return }
            DispatchQueue.main.async {
                self.updateFromViewModel()
            }
        }
    }
    
    private func updateFromViewModel() {
        switch viewModel.state {
        case .loading:
            showLoading()
        case .loaded:
            hideLoading()
            tableView.reloadData()
        case .error:
            hideLoading()
            showError()
        }
    }
    
    private func showError() {
        CommonUtils.showErrorAlert(in: self, title: LocalizedString(key:"status.load.error.title"), message: LocalizedString(key: "status.load.error.body"))
    }
    
    private func showLoading() {
        loadingViewController.show(in: self)
    }
    
    private func hideLoading() {
        loadingViewController.hide()
    }
    
}

// MARK: - UITableViewDataSource
extension TubeLineStatusViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.state.lines.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TubeLineStatusCell = tableView.dequeueReusableCellWithDefaultIdentifier()
        cell.isUserInteractionEnabled = false
        let line = viewModel.state.lines[indexPath.row]
        cell.configure(line, row: indexPath.row + 1)
        return cell
    }
    
}

