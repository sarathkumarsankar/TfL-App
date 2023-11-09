import Foundation

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
        urlSession.dataTask(with: urlRequest(for: request)) { responseData, response, error in
            if let error = error {
                completion(.failure(.networkError(description: error.localizedDescription)))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.networkError(description: "Invalid HTTP response")))
                return
            }

            guard (200..<300).contains(httpResponse.statusCode) else {
                completion(.failure(.networkError(description: "HTTP status code: \(httpResponse.statusCode)")))
                return
            }
            guard let data = responseData else {
                completion(.failure(.networkError(description: "No response data received.")))
                return
            }
            do {
                let response = try JSONDecoder().decode(Value.self, from: data)
                completion(.success(response))
            } catch let parsingError {
                completion(.failure(.parsingError(underlyingError: parsingError)))
            }
        }.resume()
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
