@testable import TfLApp

class MockAPIManager<ResultType: Decodable>: APIManaging {
    let result: Result<ResultType, APIError>
    
    init(result: Result<ResultType, APIError>) {
        self.result = result
    }
    
    func execute<Value: Decodable>(_ request: Request<Value>, completion: @escaping (Result<Value, APIError>) -> Void) {
        if let result = result as? Result<Value, APIError> {
            completion(result)
        }
    }
}
