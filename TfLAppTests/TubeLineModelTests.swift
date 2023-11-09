import XCTest
@testable import TfLApp

final class TubeLineModelTests: XCTestCase {

    func testDecodeTubeLine() {
          // Given
          let json = """
          {
              "id": "123",
              "name": "Example Line",
              "modeName": "Subway",
              "disruptions": null,
              "created": "2023-11-09T12:00:00",
              "modified": "2023-11-09T13:00:00",
          "lineStatuses": [
            {
              "$type": "Tfl.Api.Presentation.Entities.LineStatus, Tfl.Api.Presentation.Entities",
              "id": 0,
              "lineId": "circle",
              "statusSeverity": 4,
              "statusSeverityDescription": "Planned Closure",
              "reason": "CIRCLE LINE: Saturday 24 and Sunday 25 March, no Circle line service throughout the line.",
              "created": "0001-01-01T00:00:00",
              "validityPeriods": [
                {
                  "$type": "Tfl.Api.Presentation.Entities.ValidityPeriod, Tfl.Api.Presentation.Entities",
                  "fromDate": "2018-03-24T04:30:00Z",
                  "toDate": "2018-03-26T01:29:00Z",
                  "isNow": true
                }
              ],
              "disruption": {
                "$type": "Tfl.Api.Presentation.Entities.Disruption, Tfl.Api.Presentation.Entities",
                "category": "PlannedWork",
                "categoryDescription": "PlannedWork",
                "description": "CIRCLE LINE: Saturday 24 and Sunday 25 March, no Circle line service throughout the line.",
                "created": "2018-01-10T09:34:00Z",
                "affectedRoutes": [],
                "affectedStops": [],
                "closureText": "plannedClosure"
              }
            }
          ],
              "routeSections": null,
              "serviceTypes": null,
              "crowding": null
          }
          """
          // When
          let data = json.data(using: .utf8)
          let decoder = JSONDecoder()

          do {
              let tubeLine = try decoder.decode(TubeLine.self, from: data!)
              // Then
              XCTAssertEqual(tubeLine.id, "123")
              XCTAssertEqual(tubeLine.name, "Example Line")
              XCTAssertEqual(tubeLine.modeName, "Subway")
              XCTAssertEqual(tubeLine.lineStatuses?.count, 1)
              
              XCTAssertEqual(tubeLine.lineStatuses?.first?.statusSeverity, 4)
              XCTAssertEqual(tubeLine.lineStatuses?.first?.statusSeverityDescription, "Planned Closure")
              XCTAssertEqual(tubeLine.lineStatuses?.first?.reason, "CIRCLE LINE: Saturday 24 and Sunday 25 March, no Circle line service throughout the line.")

              XCTAssertEqual(tubeLine.lineStatuses?.first?.disruption?.category, "PlannedWork")
              XCTAssertEqual(tubeLine.lineStatuses?.first?.disruption?.categoryDescription, "PlannedWork")
              XCTAssertEqual(tubeLine.lineStatuses?.first?.disruption?.description, "CIRCLE LINE: Saturday 24 and Sunday 25 March, no Circle line service throughout the line.")
              XCTAssertEqual(tubeLine.lineStatuses?.first?.disruption?.closureText, "plannedClosure")
          } catch {
              XCTFail("Failed to decode TubeLine: \(error)")
          }
      }
}
