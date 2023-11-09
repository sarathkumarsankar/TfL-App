
import Foundation

enum LineStatusViewModelState: Equatable {
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

    static func == (lhs: LineStatusViewModelState, rhs: LineStatusViewModelState) -> Bool {
        switch (lhs, rhs) {
        case (.error, .error):
            return true
        default:
            return false
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
                self?.state = .loaded(lines)
            case .failure:
                self?.state = .error
            }
        }
    }
}
