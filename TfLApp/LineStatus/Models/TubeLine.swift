import Foundation

struct TubeLine: Codable {
    let id: String
    let name: String
    let modeName: String
    let disruptions: [Disruption]?
    let created: String
    let modified: String
    let lineStatuses: [LineStatus]?
    let routeSections: [RouteSection]?
    let serviceTypes: [LineServiceTypeInfo]?
    let crowding: Crowding?
}

struct Disruption: Codable {
    let category: String
    let categoryDescription: String
    let description: String
    let created: String?
    let affectedRoutes: [String]
    let affectedStops: [String]
    let closureText: String
}

struct LineStatus: Codable {
    let id: Int?
    let lineId: String?
    let statusSeverity: Int?
    let statusSeverityDescription: String?
    let reason: String?
    let validityPeriods: [ValidityPeriod]?
    let disruption: Disruption?
}

struct ValidityPeriod: Codable {
    let fromDate: String
    let toDate: String
    let isNow: Bool
}

struct RouteSection: Codable {
}

struct LineServiceTypeInfo: Codable {
    let name: String?
    let uri: String?
}

struct Crowding: Codable {
    let type: String?

    private enum CodingKeys: String, CodingKey {
        case type = "$type"
    }
}

extension TubeLine {
    static var status: Request<[TubeLine]> {
        return Request(method: .get, path: "/Line/Mode/Tube/Status")
    }
}
