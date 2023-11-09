import UIKit

final class TubeLineStatusViewController: UITableViewController {
    private let viewModel: TubeLineStatusViewModel
    let loadingViewController = LoadingViewController()
    
    private enum AccessibilityIdentifier {
        static let tableViewIdentifier = "TubeLineStatusTableView"
        static let nameLabel = "nameLabel"
        static let statusLabel = "statusLabel"
    }

    init(viewModel: TubeLineStatusViewModel) {
        self.viewModel = viewModel
        // Using grouped style for a grouped table view
        super.init(style: .grouped)
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
    
    // MARK: - Private Methods
    
    private func configureTableView() {
        tableView.registerClassWithDefaultIdentifier(cellClass: TubeLineStatusCell.self)
        tableView.registerClassWithDefaultIdentifier(cellClass: AllLineStatusCell.self)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.accessibilityIdentifier = AccessibilityIdentifier.tableViewIdentifier
        tableView.contentInset = UIEdgeInsets(top: 20.0, left: 0, bottom: 0, right: 0)
        
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.backgroundColor = UIColor.white
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
        CommonUtils.showErrorAlert(in: self, title: LocalizedString(key: "status.load.error.title"), message: LocalizedString(key: "status.load.error.body"))
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
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.state.lines.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TubeLineStatusCell = tableView.dequeueReusableCellWithDefaultIdentifier()
        cell.isUserInteractionEnabled = false
        let lineIndex = indexPath.row
        cell.configure(viewModel.state.lines[lineIndex])
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension TubeLineStatusViewController {
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell: AllLineStatusCell = tableView.dequeueReusableCellWithDefaultIdentifier()
        headerCell.contentView.backgroundColor = .white
        return headerCell.contentView
    }
}
