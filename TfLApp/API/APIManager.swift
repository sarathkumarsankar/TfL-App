import Foundation

// Your JSON data
let jsonData = """
    [
      {
        "$type": "Tfl.Api.Presentation.Entities.Line, Tfl.Api.Presentation.Entities",
        "id": "bakerloo",
        "name": "Bakerloo",
        "modeName": "tube",
        "disruptions": [],
        "created": "2023-10-31T15:28:42.2Z",
        "modified": "2023-10-31T15:28:42.2Z",
        "lineStatuses": [
          {
            "$type": "Tfl.Api.Presentation.Entities.LineStatus, Tfl.Api.Presentation.Entities",
            "id": 0,
            "statusSeverity": 10,
            "statusSeverityDescription": "Good Service",
            "created": "0001-01-01T00:00:00",
            "validityPeriods": []
          }
        ],
        "routeSections": [],
        "serviceTypes": [
          {
            "$type": "Tfl.Api.Presentation.Entities.LineServiceTypeInfo, Tfl.Api.Presentation.Entities",
            "name": "Regular",
            "uri": "/Line/Route?ids=Bakerloo&serviceTypes=Regular"
          }
        ],
        "crowding": {
          "$type": "Tfl.Api.Presentation.Entities.Crowding, Tfl.Api.Presentation.Entities"
        }
      },
      {
        "$type": "Tfl.Api.Presentation.Entities.Line, Tfl.Api.Presentation.Entities",
        "id": "central",
        "name": "Central",
        "modeName": "tube",
        "disruptions": [],
        "created": "2023-10-31T15:28:42.2Z",
        "modified": "2023-10-31T15:28:42.2Z",
        "lineStatuses": [
          {
            "$type": "Tfl.Api.Presentation.Entities.LineStatus, Tfl.Api.Presentation.Entities",
            "id": 0,
            "statusSeverity": 10,
            "statusSeverityDescription": "Good Service",
            "created": "0001-01-01T00:00:00",
            "validityPeriods": []
          }
        ],
        "routeSections": [],
        "serviceTypes": [
          {
            "$type": "Tfl.Api.Presentation.Entities.LineServiceTypeInfo, Tfl.Api.Presentation.Entities",
            "name": "Regular",
            "uri": "/Line/Route?ids=Central&serviceTypes=Regular"
          },
          {
            "$type": "Tfl.Api.Presentation.Entities.LineServiceTypeInfo, Tfl.Api.Presentation.Entities",
            "name": "Night",
            "uri": "/Line/Route?ids=Central&serviceTypes=Night"
          }
        ],
        "crowding": {
          "$type": "Tfl.Api.Presentation.Entities.Crowding, Tfl.Api.Presentation.Entities"
        }
      },
      {
        "$type": "Tfl.Api.Presentation.Entities.Line, Tfl.Api.Presentation.Entities",
        "id": "circle",
        "name": "Circle",
        "modeName": "tube",
        "disruptions": [],
        "created": "2023-10-31T15:28:42.183Z",
        "modified": "2023-10-31T15:28:42.183Z",
        "lineStatuses": [
          {
            "$type": "Tfl.Api.Presentation.Entities.LineStatus, Tfl.Api.Presentation.Entities",
            "id": 0,
            "statusSeverity": 10,
            "statusSeverityDescription": "Good Service",
            "created": "0001-01-01T00:00:00",
            "validityPeriods": []
          }
        ],
        "routeSections": [],
        "serviceTypes": [
          {
            "$type": "Tfl.Api.Presentation.Entities.LineServiceTypeInfo, Tfl.Api.Presentation.Entities",
            "name": "Regular",
            "uri": "/Line/Route?ids=Circle&serviceTypes=Regular"
          }
        ],
        "crowding": {
          "$type": "Tfl.Api.Presentation.Entities.Crowding, Tfl.Api.Presentation.Entities"
        }
      },
      {
        "$type": "Tfl.Api.Presentation.Entities.Line, Tfl.Api.Presentation.Entities",
        "id": "district",
        "name": "District",
        "modeName": "tube",
        "disruptions": [],
        "created": "2023-10-31T15:28:42.183Z",
        "modified": "2023-10-31T15:28:42.183Z",
        "lineStatuses": [
          {
            "$type": "Tfl.Api.Presentation.Entities.LineStatus, Tfl.Api.Presentation.Entities",
            "id": 0,
            "statusSeverity": 10,
            "statusSeverityDescription": "Good Service",
            "created": "0001-01-01T00:00:00",
            "validityPeriods": []
          }
        ],
        "routeSections": [],
        "serviceTypes": [
          {
            "$type": "Tfl.Api.Presentation.Entities.LineServiceTypeInfo, Tfl.Api.Presentation.Entities",
            "name": "Regular",
            "uri": "/Line/Route?ids=District&serviceTypes=Regular"
          }
        ],
        "crowding": {
          "$type": "Tfl.Api.Presentation.Entities.Crowding, Tfl.Api.Presentation.Entities"
        }
      },
      {
        "$type": "Tfl.Api.Presentation.Entities.Line, Tfl.Api.Presentation.Entities",
        "id": "hammersmith-city",
        "name": "Hammersmith & City",
        "modeName": "tube",
        "disruptions": [],
        "created": "2023-10-31T15:28:42.2Z",
        "modified": "2023-10-31T15:28:42.2Z",
        "lineStatuses": [
          {
            "$type": "Tfl.Api.Presentation.Entities.LineStatus, Tfl.Api.Presentation.Entities",
            "id": 0,
            "statusSeverity": 10,
            "statusSeverityDescription": "Good Service",
            "created": "0001-01-01T00:00:00",
            "validityPeriods": []
          }
        ],
        "routeSections": [],
        "serviceTypes": [
          {
            "$type": "Tfl.Api.Presentation.Entities.LineServiceTypeInfo, Tfl.Api.Presentation.Entities",
            "name": "Regular",
            "uri": "/Line/Route?ids=Hammersmith & City&serviceTypes=Regular"
          }
        ],
        "crowding": {
          "$type": "Tfl.Api.Presentation.Entities.Crowding, Tfl.Api.Presentation.Entities"
        }
      },
      {
        "$type": "Tfl.Api.Presentation.Entities.Line, Tfl.Api.Presentation.Entities",
        "id": "jubilee",
        "name": "Jubilee",
        "modeName": "tube",
        "disruptions": [],
        "created": "2023-10-31T15:28:42.183Z",
        "modified": "2023-10-31T15:28:42.183Z",
        "lineStatuses": [
          {
            "$type": "Tfl.Api.Presentation.Entities.LineStatus, Tfl.Api.Presentation.Entities",
            "id": 0,
            "statusSeverity": 10,
            "statusSeverityDescription": "Good Service",
            "created": "0001-01-01T00:00:00",
            "validityPeriods": []
          }
        ],
        "routeSections": [],
        "serviceTypes": [
          {
            "$type": "Tfl.Api.Presentation.Entities.LineServiceTypeInfo, Tfl.Api.Presentation.Entities",
            "name": "Regular",
            "uri": "/Line/Route?ids=Jubilee&serviceTypes=Regular"
          },
          {
            "$type": "Tfl.Api.Presentation.Entities.LineServiceTypeInfo, Tfl.Api.Presentation.Entities",
            "name": "Night",
            "uri": "/Line/Route?ids=Jubilee&serviceTypes=Night"
          }
        ],
        "crowding": {
          "$type": "Tfl.Api.Presentation.Entities.Crowding, Tfl.Api.Presentation.Entities"
        }
      },
      {
        "$type": "Tfl.Api.Presentation.Entities.Line, Tfl.Api.Presentation.Entities",
        "id": "metropolitan",
        "name": "Metropolitan",
        "modeName": "tube",
        "disruptions": [],
        "created": "2023-10-31T15:28:42.183Z",
        "modified": "2023-10-31T15:28:42.183Z",
        "lineStatuses": [
          {
            "$type": "Tfl.Api.Presentation.Entities.LineStatus, Tfl.Api.Presentation.Entities",
            "id": 0,
            "statusSeverity": 10,
            "statusSeverityDescription": "Good Service",
            "created": "0001-01-01T00:00:00",
            "validityPeriods": []
          }
        ],
        "routeSections": [],
        "serviceTypes": [
          {
            "$type": "Tfl.Api.Presentation.Entities.LineServiceTypeInfo, Tfl.Api.Presentation.Entities",
            "name": "Regular",
            "uri": "/Line/Route?ids=Metropolitan&serviceTypes=Regular"
          }
        ],
        "crowding": {
          "$type": "Tfl.Api.Presentation.Entities.Crowding, Tfl.Api.Presentation.Entities"
        }
      },
      {
        "$type": "Tfl.Api.Presentation.Entities.Line, Tfl.Api.Presentation.Entities",
        "id": "northern",
        "name": "Northern",
        "modeName": "tube",
        "disruptions": [],
        "created": "2023-10-31T15:28:42.183Z",
        "modified": "2023-10-31T15:28:42.183Z",
        "lineStatuses": [
          {
            "$type": "Tfl.Api.Presentation.Entities.LineStatus, Tfl.Api.Presentation.Entities",
            "id": 0,
            "statusSeverity": 10,
            "statusSeverityDescription": "Good Service",
            "created": "0001-01-01T00:00:00",
            "validityPeriods": []
          }
        ],
        "routeSections": [],
        "serviceTypes": [
          {
            "$type": "Tfl.Api.Presentation.Entities.LineServiceTypeInfo, Tfl.Api.Presentation.Entities",
            "name": "Regular",
            "uri": "/Line/Route?ids=Northern&serviceTypes=Regular"
          },
          {
            "$type": "Tfl.Api.Presentation.Entities.LineServiceTypeInfo, Tfl.Api.Presentation.Entities",
            "name": "Night",
            "uri": "/Line/Route?ids=Northern&serviceTypes=Night"
          }
        ],
        "crowding": {
          "$type": "Tfl.Api.Presentation.Entities.Crowding, Tfl.Api.Presentation.Entities"
        }
      },
      {
        "$type": "Tfl.Api.Presentation.Entities.Line, Tfl.Api.Presentation.Entities",
        "id": "piccadilly",
        "name": "Piccadilly",
        "modeName": "tube",
        "disruptions": [],
        "created": "2023-10-31T15:28:42.183Z",
        "modified": "2023-10-31T15:28:42.183Z",
        "lineStatuses": [
          {
            "$type": "Tfl.Api.Presentation.Entities.LineStatus, Tfl.Api.Presentation.Entities",
            "id": 0,
            "statusSeverity": 10,
            "statusSeverityDescription": "Good Service",
            "created": "0001-01-01T00:00:00",
            "validityPeriods": []
          }
        ],
        "routeSections": [],
        "serviceTypes": [
          {
            "$type": "Tfl.Api.Presentation.Entities.LineServiceTypeInfo, Tfl.Api.Presentation.Entities",
            "name": "Regular",
            "uri": "/Line/Route?ids=Piccadilly&serviceTypes=Regular"
          },
          {
            "$type": "Tfl.Api.Presentation.Entities.LineServiceTypeInfo, Tfl.Api.Presentation.Entities",
            "name": "Night",
            "uri": "/Line/Route?ids=Piccadilly&serviceTypes=Night"
          }
        ],
        "crowding": {
          "$type": "Tfl.Api.Presentation.Entities.Crowding, Tfl.Api.Presentation.Entities"
        }
      },
      {
        "$type": "Tfl.Api.Presentation.Entities.Line, Tfl.Api.Presentation.Entities",
        "id": "victoria",
        "name": "Victoria",
        "modeName": "tube",
        "disruptions": [],
        "created": "2023-10-31T15:28:42.2Z",
        "modified": "2023-10-31T15:28:42.2Z",
        "lineStatuses": [
          {
            "$type": "Tfl.Api.Presentation.Entities.LineStatus, Tfl.Api.Presentation.Entities",
            "id": 0,
            "statusSeverity": 10,
            "statusSeverityDescription": "Good Service",
            "created": "0001-01-01T00:00:00",
            "validityPeriods": []
          }
        ],
        "routeSections": [],
        "serviceTypes": [
          {
            "$type": "Tfl.Api.Presentation.Entities.LineServiceTypeInfo, Tfl.Api.Presentation.Entities",
            "name": "Regular",
            "uri": "/Line/Route?ids=Victoria&serviceTypes=Regular"
          },
          {
            "$type": "Tfl.Api.Presentation.Entities.LineServiceTypeInfo, Tfl.Api.Presentation.Entities",
            "name": "Night",
            "uri": "/Line/Route?ids=Victoria&serviceTypes=Night"
          }
        ],
        "crowding": {
          "$type": "Tfl.Api.Presentation.Entities.Crowding, Tfl.Api.Presentation.Entities"
        }
      },
      {
        "$type": "Tfl.Api.Presentation.Entities.Line, Tfl.Api.Presentation.Entities",
        "id": "circle",
        "name": "Circle",
        "modeName": "tube",
        "disruptions": [],
        "created": "2018-03-14T17:44:30.937Z",
        "modified": "2018-03-14T17:44:30.937Z",
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
        "routeSections": [],
        "serviceTypes": [
          {
            "$type": "Tfl.Api.Presentation.Entities.LineServiceTypeInfo, Tfl.Api.Presentation.Entities",
            "name": "Regular",
            "uri": "/Line/Route?ids=Circle&serviceTypes=Regular"
          }
        ],
        "crowding": {
          "$type": "Tfl.Api.Presentation.Entities.Crowding, Tfl.Api.Presentation.Entities"
        }
      }
    ]
    """.data(using: .utf8)

enum APIError: Error {
    case networkError(description: String)
    case parsingError(underlyingError: Error)
}

extension URL {
    func url(with queryItems: [URLQueryItem]) -> URL? {
         guard var components = URLComponents(url: self, resolvingAgainstBaseURL: true) else {
             return nil
         }
         components.queryItems = (components.queryItems ?? []) + queryItems
         return components.url
     }

    init?<Value>(_ host: String, _ apiKey: String, _ request: Request<Value>) {
        guard let url = URL(string: host)?.appendingPathComponent(request.path) else {
            return nil
        }
        
        let queryItems = [URLQueryItem(name: "app_key", value: apiKey)]
        
        guard let finalURL = url.url(with: queryItems) else {
            return nil
        }
        
        self = finalURL
    }
}

protocol APIManaging {
    func execute<Value: Decodable>(_ request: Request<Value>, completion: @escaping (Result<Value, APIError>) -> Void)
}

final class APIManager: APIManaging {
    
    static let shared = APIManager()
    
    let host = ConfigurationManager.shared.host
    let apiKey = ConfigurationManager.shared.apiKey
    
    private let urlSession: URLSession
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func execute<Value: Decodable>(_ request: Request<Value>, completion: @escaping (Result<Value, APIError>) -> Void) {
        print(Value.self)

        if let jsonData = jsonData {
            do {
                let lines = try JSONDecoder().decode([TubeLine].self, from: jsonData)
                print(lines)
            } catch {
                print("Error: \(error)")
            }
        }
//        urlSession.dataTask(with: urlRequest(for: request)) { responseData, response, error in
//            if let error = error {
//                completion(.failure(.networkError(description: error.localizedDescription)))
//                return
//            }
//            guard let httpResponse = response as? HTTPURLResponse else {
//                completion(.failure(.networkError(description: "Invalid HTTP response")))
//                return
//            }
//
//            guard (200..<300).contains(httpResponse.statusCode) else {
//                completion(.failure(.networkError(description: "HTTP status code: \(httpResponse.statusCode)")))
//                return
//            }
//            guard let data = responseData else {
//                completion(.failure(.networkError(description: "No response data received.")))
//                return
//            }
//            do {
//                let response = try JSONDecoder().decode(Value.self, from: data)
//                completion(.success(response))
//            } catch let parsingError {
//                completion(.failure(.parsingError(underlyingError: parsingError)))
//            }
//        }.resume()
    }
    
    private func urlRequest<Value>(for request: Request<Value>) -> URLRequest {
        guard let url = URL(host, apiKey, request) else {
            fatalError("Invalid URL")
        }

        var result = URLRequest(url: url)
        result.httpMethod = request.method.rawValue
        result.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        return result
    }
}
