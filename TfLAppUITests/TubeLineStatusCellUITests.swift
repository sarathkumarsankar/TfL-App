import XCTest
@testable import TfLApp

class TubeLineStatusCellUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testCustomTableViewCell() {
        let tableView = app.tables["TubeLineStatusTableView"]
        XCTAssertTrue(tableView.exists, "Table view does not exist")

        let cell = tableView.cells.element(boundBy: 0)
        XCTAssertTrue(cell.waitForExistence(timeout: 5), "Cell not found")

        let nameLabel = cell.staticTexts["nameLabel"]
        let statusLabel = cell.staticTexts["statusLabel"]

        let label1Exists = NSPredicate(format: "label.length > 0")
        expectation(for: label1Exists, evaluatedWith: nameLabel, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        
        let label2Exists = NSPredicate(format: "label.length > 0")
        expectation(for: label1Exists, evaluatedWith: statusLabel, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)

    }

}
