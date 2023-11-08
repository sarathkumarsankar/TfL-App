
import Foundation

enum LineStatusViewModelState {
    case loading
    case loaded([TubeLine])
    case error

    var lines: [TubeLine] {
        switch self {
        case .loaded(let lines):
            return lines
        case .loading, .error:
            return []
        }
    }
}

final class TubeLineStatusViewModel {

    private let apiManager: APIManaging

    init(apiManager: APIManaging = APIManager()) {
        self.apiManager = apiManager
    }

    var updatedState: (() -> Void)?

    var state: LineStatusViewModelState = .loading {
        didSet {
            updatedState?()
        }
    }

    func fetchData() {
        apiManager.execute(TubeLine.status) { [weak self] result in
            switch result {
            case .success(let lines):
                print(lines)
                self?.state = .loaded(lines)
            case .failure(let error):
                print(error)
                self?.state = .error
            }
        }
    }
}