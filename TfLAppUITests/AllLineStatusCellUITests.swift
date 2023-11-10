import XCTest

class AllLineStatusCellUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        // Launch your app or navigate to the relevant screen containing the AllLineStatusCell
        app.launch()
    }
    
    func testTableViewHeader() {
        let tableView = app.tables["TubeLineStatusTableView"]

        // Access individual elements within the header cell
        let statusLabel = tableView.staticTexts["statusTextLabelIdentifier"]
        let liveImageView = tableView.images["liveImageViewIdentifier"]
        let statusValueLabel = tableView.staticTexts["statusValueLabelIdentifier"]

        // Assert properties of individual elements
        XCTAssertEqual(statusLabel.label, "Status")
        XCTAssertTrue(liveImageView.exists)
        XCTAssertEqual(statusValueLabel.label, "Live")
    }
    override func tearDownWithError() throws {
        // Clean up after each test if needed
    }
}
