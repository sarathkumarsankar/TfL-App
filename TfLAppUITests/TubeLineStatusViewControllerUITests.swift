import XCTest
@testable import TfLApp

final class TubeLineStatusViewControllerUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
        
    func testTableViewInteraction() {
        // Assuming your table view has accessibility identifier "YourTableViewIdentifier"
        let tableView = app.tables["TubeLineStatusTableView"]
        XCTAssertTrue(tableView.exists, "Table view does not exist")
        
        // Assuming your cells have accessibility identifiers like "YourCellIdentifier"
        let cell = tableView.cells.element(boundBy: 0)
        XCTAssertTrue(cell.waitForExistence(timeout: 5), "Cell not found")
    }
    
}
