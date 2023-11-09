
import Foundation
// MARK: - LineStatusViewModelState

// Represents the state of the TubeLineStatusViewModel
enum LineStatusViewModelState: Equatable {
    case loading
    case loaded([TubeLine])
    case error

    // Extracts the response model from the state, returns an empty array for loading and error states
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

// MARK: - TubeLineStatusViewModel

// View model for the Tube Line Status
final class TubeLineStatusViewModel {

    private let apiManager: APIManaging

    //Dependency injection for APIManager
    init(apiManager: APIManaging = APIManager()) {
        self.apiManager = apiManager
    }

    // Closure to notify observers when the state is updated
    var updatedState: (() -> Void)?

    // Represents the current state of the view model
    var state: LineStatusViewModelState = .loading {
        didSet {
            updatedState?()
        }
    }

    // Fetches data from the API
    func fetchData() {
        apiManager.execute(TubeLine.status) { [weak self] result in
            switch result {
            case .success(let lines):
                // Update the state with loaded lines
                self?.state = .loaded(lines)
            case .failure(_):
                // Update the state with an error, passing along the error information
                self?.state = .error
            }
        }
    }
}
