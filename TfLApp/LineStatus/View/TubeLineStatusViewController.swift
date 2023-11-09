import UIKit

final class TubeLineStatusViewController: UITableViewController {
    private let viewModel: TubeLineStatusViewModel
    let loadingViewController = LoadingViewController()
    
    private enum AccessiblityIdentifier {
        static let tableViewIdentifier = "TubeLineStatusTableView"
        static let nameLabel = "nameLabel"
        static let statusLabel = "statusLabel"
    }

    init(viewModel: TubeLineStatusViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        updateFromViewModel()
        bindViewModel()
        viewModel.fetchData()
    }
    
    private func configureTableView() {
        tableView.registerNibWithDefaultIdentifier(cellClass: TubeLineStatusCell.self)
        tableView.registerNibWithDefaultIdentifier(cellClass: AllLineStatusCell.self)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.accessibilityIdentifier = AccessiblityIdentifier.tableViewIdentifier
        tableView.contentInset = UIEdgeInsets(top: 20.0, left: 0, bottom: 0, right: 0)
    }
    
    private func bindViewModel() {
        viewModel.updatedState = { [weak self] in
            guard let self else { return }
            DispatchQueue.main.async {
                self.updateFromViewModel()
            }
        }
    }
    
    func updateFromViewModel() {
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
        return viewModel.state.lines.count + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell: AllLineStatusCell = tableView.dequeueReusableCellWithDefaultIdentifier()
            cell.isUserInteractionEnabled = false
            return cell
        } else {
            let cell: TubeLineStatusCell = tableView.dequeueReusableCellWithDefaultIdentifier()
            cell.isUserInteractionEnabled = false
            let lineIndex = indexPath.row - 1
            let line = viewModel.state.lines[lineIndex]
            cell.configure(line, row: indexPath.row + 1)
            return cell
        }
    }
    
}

extension TubeLineStatusViewController {
    // Hide separator for the first row
       override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
           if indexPath.row == 0 {
               cell.separatorInset = UIEdgeInsets(top: 0, left: tableView.bounds.size.width, bottom: 0, right: 0)
           } else {
               cell.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15) // Adjust as needed
           }
       }
}
