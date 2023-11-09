import XCTest
@testable import TfLApp

final class TubeLineStatusViewModelTests: XCTestCase {
    
    func testFetchDataSuccess() {
        // Given
        let tubeLine = TubeLine(id: "Test line", name: "Test line", modeName: "tube", disruptions: [], created: "2018-03-14T17:44:30.937Z", modified: "", lineStatuses: nil, routeSections: nil, serviceTypes: nil, crowding: nil)
        
        let apiManager = MockAPIManager(result: .success([tubeLine]))
        let viewModel = TubeLineStatusViewModel(apiManager: apiManager)
        
        let expectation = self.expectation(description: "Fetch data expectation")
        
        // Then
        viewModel.updatedState = {
            switch viewModel.state {
            case .loaded(let lines):
                XCTAssertEqual(lines.count, 1)
                XCTAssertEqual(lines.first?.id, "Test line")
                XCTAssertEqual(lines.first?.name, "Test line")
                XCTAssertEqual(lines.first?.modeName, "tube")
                XCTAssertEqual(lines.first?.created, "2018-03-14T17:44:30.937Z")
                expectation.fulfill()
            case .loading, .error:
                XCTFail("Fetch data should succeed")
                expectation.fulfill()
            }
        }
        // When
        viewModel.fetchData()
        waitForExpectations(timeout: 10, handler: nil)
    }

    func testFetchDataFailure() {
        // Given
        let apiManager = MockAPIManager<[TubeLine]>(result: .failure(.networkError(description: "Server not responding")))
        let viewModel = TubeLineStatusViewModel(apiManager: apiManager)
        
        let expectation = self.expectation(description: "Should return error")
        
        
        // Then
        viewModel.updatedState = {
            switch viewModel.state {
            case .loaded:
                XCTFail("Fetch data should fail")
            case .loading, .error:
                XCTAssertEqual(viewModel.state, .error)
            }
            expectation.fulfill()
        }
        
        // When
        viewModel.fetchData()
        
        waitForExpectations(timeout: 10, handler: nil)
    }
}
